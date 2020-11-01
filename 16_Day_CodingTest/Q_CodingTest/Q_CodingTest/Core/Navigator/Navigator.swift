//
//  Navigator.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

final class Navigator: NSObject {

  func navigate(to scene: Scene) -> UIViewController {
    switch scene {
    case .alphabetList:
      let viewModel = AlphabetListViewModel()
      return AlphabetListViewController(viewModel: viewModel, navigator: self)
    }
  }
}

extension Navigator {
  
  static let defaults = Navigator()
}
