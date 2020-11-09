//
//  AppDelegate.swift
//  CustomNavigationBar
//
//  Created by Buzz.Kim on 2020/11/08.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let backButtonImage = UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
    
    UINavigationBar.appearance().backIndicatorImage = backButtonImage
    UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
    
    // back button title 숨기는 방법
    UIBarButtonItem.appearance().setTitleTextAttributes(
      [.foregroundColor: UIColor.clear],
      for: .normal
    )
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)

    // 전체적으로 statusBar를 바꾸는 방법
    // info.plist에 View controller-based status bar appearance NO로 설정 필요
    // UIApplication.shared.statusBarStyle = .lightContent
    
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

