//
//  BaseNavigationController.swift
//  CustomNavigationBar
//
//  Created by Buzz.Kim on 2020/11/09.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController {
  
  open override var childForStatusBarStyle: UIViewController? {
    return self.topViewController
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  public func setupUI() {

  }
  
}
