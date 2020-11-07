//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Buzz.Kim on 2020/11/08.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "네비게이션 바"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    customNavigationBar()
  }
  
  private func customNavigationBar() {
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.largeTitleTextAttributes = [
      .foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0),
      .font: UIFont.systemFont(ofSize: 50, weight: .light)
    ]

  }
  
}
