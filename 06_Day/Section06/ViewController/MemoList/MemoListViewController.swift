//
//  MemoListViewController.swift
//  Section06
//
//  Created by seungjin on 2020/01/16.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var memos: [Memo] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }
  
  private func setupUI() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  @IBAction func addMemo(_ sender: UIBarButtonItem) {
    if let naviVC = storyboard?.instantiateViewController(withIdentifier: String(describing: "MemoComposeViewController")) as? UINavigationController,
      let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
      
      composeVC.addHandler = { memo in
        self.memos.insert(memo, at: 0)
        self.saveAll()
        self.tableView.reloadData()
      }
      
      present(naviVC, animated: true, completion: nil)
    }
  }
  
  func saveAll() {
    
    let data = memos.map { memo in
      [
        "content" : memo.content,
        "insertDate" : memo.date
      ]
    }
    
    let userDefaults = UserDefaults.standard
    userDefaults.set(data, forKey: UserDefaultsKeys.memoList)
    userDefaults.synchronize()
  }
  
}

extension MemoListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return memos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MemoCell.self), for: indexPath) as? MemoCell else {
      return UITableViewCell()
    }
    
    cell.contentLabel.text = memos[indexPath.row].content
    
    return cell
  }
  
}

extension MemoListViewController: UITableViewDelegate {
  
}
