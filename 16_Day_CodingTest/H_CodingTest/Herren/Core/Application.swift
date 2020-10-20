//
//  Application.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

final class Application: NSObject {

  var window: UIWindow?
  
  private override init() {
    
  }
  
  func presentInitialScreen(in window: UIWindow?) {
    guard let window = window else { return }
    self.window = window
    window.rootViewController = ViewController()
    window.backgroundColor = UIColor.white
    window.makeKeyAndVisible()
  }
}

extension Application {
  
  // singleton
  static let shared = Application()
}
