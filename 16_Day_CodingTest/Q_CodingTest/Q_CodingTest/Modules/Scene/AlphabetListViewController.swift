//
//  AlphabetListViewController.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class AlphabetListViewController: BaseViewController {
  
  //MARK: - Constant
  
  struct Constant {
    
  }
  
  struct UI {
    static let collectionViewColumn: CGFloat = 3
    static let footerViewHeight: CGFloat = 44
    static let headerViewHeight: CGFloat = 44
  }
  
  //MARK: - UI Properties
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false
    tableView.register(
      SelectedAlphabetListTableViewCell.self,
      forCellReuseIdentifier: SelectedAlphabetListTableViewCell.reuseIdentifier
    )
    tableView.register(
      AlphabetListTableViewCell.self,
      forCellReuseIdentifier: AlphabetListTableViewCell.reuseIdentifier
    )

    return tableView
  }()
  
  //MARK: - Properties
  
  var viewModel: AlphabetListViewModelAdaptor
  var navigator: Navigator
  
  //MARK: - Initialize
  
  init(viewModel: AlphabetListViewModelAdaptor, navigator: Navigator) {
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
    
    [tableView].forEach {
      self.view.addSubview($0)
    }
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
  }
  
  override func bind() {
    super.bind()
    
  }
  
}

//MARK: - UI

extension AlphabetListViewController {
  
}
