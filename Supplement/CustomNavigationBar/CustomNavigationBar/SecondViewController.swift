//
//  SecondViewController.swift
//  CustomNavigationBar
//
//  Created by Buzz.Kim on 2020/11/08.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.tintColor = .white
    navigationItem.largeTitleDisplayMode = .never

    tableView.contentInsetAdjustmentBehavior = .never
    
  }
  
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell")!
      
      return cell
    } else {
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 200
    } else {
      return 80
    }
  }
  
}
