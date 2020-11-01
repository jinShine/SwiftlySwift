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
    switch AlphabetListViewModel.SectionType(rawValue: indexPath.section) {
    case .selectedAlphabetList:
      let height = ((view.bounds.width - (App.basicLine * 2)) / UI.collectionViewColumn) * 2
      return height
    case .alphabetList:
      return 100
    default:
      return .zero
    }
  }
}

// MARK: - Tableview decorator

extension AlphabetListViewController: TableViewDecorator {
  
  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    switch AlphabetListViewModel.SectionType(rawValue: indexPath.section) {
    case .selectedAlphabetList:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: SelectedAlphabetListTableViewCell.reuseIdentifier, for: indexPath
        ) as? SelectedAlphabetListTableViewCell else { return UITableViewCell() }

      return cell
    case .alphabetList:
//      guard let cell = tableView.dequeueReusableCell(
//        withIdentifier: SelectedAlphabetListTableViewCell.reuseIdentifier, for: indexPath
//        ) as? SelectedAlphabetListTableViewCell else { return UITableViewCell() }
//
//      return cell
      return UITableViewCell()
    default:
      return UITableViewCell()
    }
  }
}
