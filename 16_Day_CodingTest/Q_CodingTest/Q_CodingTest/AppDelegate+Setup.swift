//
//  AppDelegate+Setup.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
  
  func setup(application: UIApplication,
             launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    App.shared.presentInitialScreen(in: window)
  }
    
  
}
