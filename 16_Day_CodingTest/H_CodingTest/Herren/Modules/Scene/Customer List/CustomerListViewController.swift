//
//  CustomerListViewController.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class CustomerListViewController: BaseViewController {
  
  //MARK: - Constant
  
  struct Constant {
    static let title = "고객 리스트"
    static let searchBarPlaceholder = "검색어를 입력해주세요."
    static let alertTitle = "정렬 방식을 선택해주세요."
    static let nameSortingTitle = "이름순"
    static let dateSortingTitle = "날짜순"
    static let cancelTitle = "취소"
  }
  
  struct UI {
    
  }
  
  //MARK: - UI Properties
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 110
    tableView.dataSource = self
    tableView.delegate = self
    tableView.prefetchDataSource = self
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false
    
    tableView.register(
      CustomerInfomationCell.self,
      forCellReuseIdentifier: CustomerInfomationCell.reuseIdentifier
    )
    
    return tableView
  }()
  
  //MARK: - Properties
  
  var viewModel: CustomerListViewModelAdaptor
  var navigator: Navigator
  
  
  //MARK: - Initialize
  
  init(viewModel: CustomerListViewModelAdaptor, navigator: Navigator) {
    self.viewModel = viewModel
    self.navigator = navigator
    
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  //MARK: - Methods
  
  override func setupUI() {
    super.setupUI()
    
    setupNavigation()
    
    [tableView].forEach {
      self.view.addSubview($0)
    }
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  override func bind() {
    super.bind()
    
    viewModel.fetchCustomerInfo(page: viewModel.page, size: viewModel.size) { [weak self] response in
      guard response.result == .success else {
        self?.showAlert(title: "에러", message: response.error?.message)
        return
      }
      
      self?.reloadData()
    }
    
  }
  
  @objc func didTapSortButton(_ sender: UIButton) {
    self.showAlert(
      title: Constant.alertTitle,
      options: [
        [Constant.nameSortingTitle: .default],
        [Constant.dateSortingTitle: .default],
        [Constant.cancelTitle: .cancel]
      ],
      preferredStyle: .actionSheet) { action in
        guard let title = action.title else { return }
        switch title {
        case Constant.nameSortingTitle:
          // 내림차순 정렬 (이름순)
          if self.viewModel.isSearching {
            self.viewModel.filteredList.sort(by: { $0.name > $1.name })
          } else {
            self.viewModel.customerList.sort(by: { $0.name > $1.name })
          }
          self.reloadData()
        case Constant.dateSortingTitle:
          // 내림차순 정렬 (날짜순)
          if self.viewModel.isSearching {
            self.viewModel.filteredList.sort(by: { $0.regdate > $1.regdate })
          } else {
            self.viewModel.customerList.sort(by: { $0.regdate > $1.regdate })
          }
          self.reloadData()
        default:
          return
        }
    }
  }
  
  func reloadData() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
}

//MARK: - UI

extension CustomerListViewController {
  
  func setupNavigation() {
    self.title = Constant.title
    self.prefersLargeTitles = true
    
    makeSortButton()
    makeSearchController()
  }
  
  private func makeSortButton() {
    let sortButton = UIButton()
    sortButton.setImage(Application.image.btnLineUp, for: .normal)
    sortButton.addTarget(self, action: #selector(didTapSortButton(_:)), for: .touchUpInside)
    let rightButton = UIBarButtonItem(customView: sortButton)
    navigationItem.setRightBarButton(rightButton, animated: false)
  }
  
  private func makeSearchController() {
    let searchController = UISearchController()
    searchController.searchBar.delegate = self
    searchController.searchBar.placeholder = Constant.searchBarPlaceholder
    self.navigationItem.searchController = searchController
  }
  
}

//MARK: - UISearchBarDelegate

extension CustomerListViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.searchQuery = searchText
    
    if searchText.isEmpty {
      viewModel.isSearching = false
    } else {
      viewModel.isSearching = true
      
      viewModel.filteredList = viewModel.customerList.filter {
        return $0.name.range(of: searchText, options: .caseInsensitive) != nil ||
          $0.contact.range(of: searchText, options: .caseInsensitive) != nil
      }
    }
    
    reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    viewModel.isSearching = false
    reloadData()
  }
}
