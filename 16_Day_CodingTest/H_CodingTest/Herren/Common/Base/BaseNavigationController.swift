//
//  BaseNavigationController.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    navigationBar.backgroundColor = .white
    navigationBar.isTranslucent = false
    navigationBar.largeTitleTextAttributes = [
      .font: Application.font.appleSDGothicNeoBold(size: 26),
      .foregroundColor: Application.color.main
    ]
  }
  
}
