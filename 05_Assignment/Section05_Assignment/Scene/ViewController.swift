//
//  ViewController.swift
//  Section05_Assignment
//
//  Created by seungjin on 2020/01/15.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //MARK:- Constant
  
  struct UI {
    static let AnimalCellHeight: CGFloat = 100
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  let animals = [
    "bear", "buffalo", "camel", "dog", "elephant",
    "koala", "llama", "panda", "lion", "horse",
    "guinea_pig", "koala", "whale_shark", "whale", "duck",
    "seagull", "black_swan", "peacock", "giraffe"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  private func setupUI() {
    tableView.dataSource = self
    tableView.delegate = self
  }
  
}

//MARK:- tableview datasource
extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    /*
     팁:
     프로젝트가 커지면 Identifier Key가 많아져 따로 관리하기 힘들다.
     그래서 Class자체를 Key로 간주해서 사용한다.(UIView+Extension)
     */
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: AnimalCell.identifier,
      for: indexPath
      ) as? AnimalCell else { return UITableViewCell() }
    
    cell.configure(with: animals[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UI.AnimalCellHeight
  }
  
}

//MARK:- tableview delegate
extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    
    showAlert(title: "동물",
              message: animals[indexPath.row],
              preferredStyle: .alert,
              completion: nil)
  }
}
