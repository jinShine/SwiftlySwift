//
//  ViewController.swift
//  Section05
//
//  Created by Seungjin on 15/01/2020.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  let numberArr = Array(0...49)


  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

  private func setupUI() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberArr.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) as? BasicCell else {
      return UITableViewCell()
    }

    cell.nameLabel.text = "\(numberArr[indexPath.row])"

    return cell
  }
}

extension UIViewController: UITableViewDelegate {

}

