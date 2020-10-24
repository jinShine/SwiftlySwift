//
//  CustomerListViewController+TableViewDecorator.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

// MARK: - Tableview datasource

extension CustomerListViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    self.configureCell(tableView: tableView, indexPath: indexPath)
  }
  
}

// MARK: - Tableview delegate

extension CustomerListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch CustomerListViewModel.SectionType(rawValue: indexPath.section) {
    case .customerInfo:
      return UITableView.automaticDimension
    default:
      return .zero
    }
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    viewModel.loadMore(at: indexPath) { [weak self] response in
      guard response.result == .success else {
        if let error = response.error {
          print(error.message)
        }
        return
      }
      
      self?.reloadData()
    }
  }
  
}

extension CustomerListViewController: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    print(indexPaths)
  }
  
  func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
    
  }
  
}

// MARK: - Tableview decorator

extension CustomerListViewController: TableViewDecorator {
  
  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    switch CustomerListViewModel.SectionType(rawValue: indexPath.section) {
    case .customerInfo:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: CustomerInfomationCell.reuseIdentifier, for: indexPath
        ) as? CustomerInfomationCell else { return UITableViewCell() }
      
      if viewModel.isSearching {
        cell.configure(with: viewModel.filteredList[indexPath.row], searchQuery: viewModel.searchQuery)
      } else {
        cell.configure(with: viewModel.customerList[indexPath.row])
      }
      
      return cell
    default:
      return UITableViewCell()
    }
  }
}
