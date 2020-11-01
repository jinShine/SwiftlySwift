//
//  Application.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

final class Application: NSObject {

  var window: UIWindow?
  var navigator: Navigator
  
  private override init() {
    self.navigator = Navigator.defaults
  }
  
  func presentInitialScreen(in window: UIWindow?) {
    guard let window = window else { return }
    self.window = window
    window.rootViewController = self.navigator.navigate(to: .alphabetList)
    window.backgroundColor = UIColor.white
    window.makeKeyAndVisible()
  }
}

extension Application {
  
  // singleton
  static let shared = Application()
}
