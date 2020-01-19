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
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

extension MemoDetailViewController: UITableViewDelegate {
  
}
