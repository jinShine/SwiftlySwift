//
//  AlphabetListViewController+TableViewDecorator.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

// MARK: - Tableview datasource

extension AlphabetListViewController: UITableViewDataSource {
  
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

extension AlphabetListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    switch CustomerListViewModel.SectionType(rawValue: indexPath.section) {
//    case .customerInfo:
//      return UITableView.automaticDimension
//    default:
//      return .zero
//    }
    return .zero
  }
}

// MARK: - Tableview decorator

extension AlphabetListViewController: TableViewDecorator {
  
  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
