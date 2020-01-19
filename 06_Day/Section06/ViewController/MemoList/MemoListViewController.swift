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
    loadAll()
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
  
  func loadAll() {
    let userDefaults = UserDefaults.standard
    guard let data = userDefaults.object(forKey: UserDefaultsKeys.memoList) as? [[String: Any]] else { return }
    
    self.memos = data.map { memo in
      let content = memo["content"] as? String ?? ""
      let insertDate = memo["insertDate"] as? Date ?? Date()
      return Memo(content: content, date: insertDate)
    }
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let detailVC = storyboard?.instantiateViewController(
      withIdentifier: String(describing: MemoDetailViewController.self)
      ) as? MemoDetailViewController else { return }
    
    detailVC.configure(with: memos[indexPath.row])
    
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
