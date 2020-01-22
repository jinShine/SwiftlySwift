//
//  MemoDetailViewController.swift
//  Section06
//
//  Created by seungjin on 2020/01/19.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {
  
  enum CellType: Int {
    case content,
    date
  }
  
  @IBOutlet weak var tableView: UITableView!

  private var memo: Memo?
  private var indexPath: IndexPath?
  var deleteHandler: ((IndexPath) -> Void)?
  var editHandler: ((Memo, IndexPath) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  private func setupUI() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  @IBAction func pop(_ sender: UIBarButtonItem) {
    guard let memo = memo, let indexPath = indexPath else { return }
    editHandler?(memo, indexPath)
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func deleteMemo(_ sender: UIBarButtonItem) {
    guard let indexPath = indexPath else { return }
    deleteHandler?(indexPath)
    navigationController?.popViewController(animated: true)
  }

  @IBAction func editMemo(_ sender: UIBarButtonItem) {
    guard let naviVC = storyboard?.instantiateViewController(withIdentifier: "MemoComposeViewController") as? UINavigationController,
    let composeVC = naviVC.viewControllers.first as? MemoComposeViewController else { return }
    
    composeVC.memo = memo
    composeVC.addHandler = { memo in
      self.memo = memo
      self.tableView.reloadData()
    }
    present(naviVC, animated: true, completion: nil)
  }

  func configure(with memo: Memo, at indexPath: IndexPath) {
    self.memo = memo
    self.indexPath = indexPath
  }
  
}

extension MemoDetailViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch CellType(rawValue: indexPath.row) {
    case .content:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: "ContentCell", for: indexPath
        ) as? ContentCell else {
        return UITableViewCell()
      }
      cell.configure(with: memo?.content)
      
      return cell
    case .date:
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
