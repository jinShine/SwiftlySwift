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
        print(memo)
      }
      
      present(naviVC, animated: true, completion: nil)
    }
  }
  
}

extension MemoListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
}

extension MemoListViewController: UITableViewDelegate {
  
}
