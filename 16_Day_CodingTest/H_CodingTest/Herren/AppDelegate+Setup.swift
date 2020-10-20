//
//  AppDelegate+Setup.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
  
  func setup(application: UIApplication,
             launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    Application.shared.presentInitialScreen(in: window)
  }
    
  
}
