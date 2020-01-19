//
//  MemoDetailViewController.swift
//  Section06
//
//  Created by seungjin on 2020/01/19.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var memo: Memo?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  private func setupUI() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  @IBAction func pop(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
  
  func configure(with memo: Memo) {
    self.memo = memo
  }
  
}

extension MemoDetailViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: "ContentCell", for: indexPath
        ) as? ContentCell else {
        return UITableViewCell()
      }
      cell.configure(with: memo?.content)
      
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: "DateCell", for: indexPath
        ) as? DateCell else {
        return UITableViewCell()
      }
      cell.configure(with: memo?.date)
      
      return cell
    default:
      return UITableViewCell()
    }
  }
}

extension MemoDetailViewController: UITableViewDelegate {
  
}
