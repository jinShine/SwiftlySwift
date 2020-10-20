//
//  Navigator.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

final class Navigator: NSObject {

  func navigate(to scene: Scene) -> UIViewController {
    switch scene {
    case .customerList:
      let viewModel = CustomerListViewModel()
      let viewController = CustomerListViewController(viewModel: viewModel, navigator: self)
      return BaseNavigationController(rootViewController: viewController)
    }
  }
}

extension Navigator {
  
  static let defaults = Navigator()
}
