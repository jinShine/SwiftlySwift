//
//  AppDelegate.swift
//  Section02
//
//  Created by seungjin on 2020/01/10.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    Thread.sleep(forTimeInterval: 2.0) // 2초

    return true
  }

}

