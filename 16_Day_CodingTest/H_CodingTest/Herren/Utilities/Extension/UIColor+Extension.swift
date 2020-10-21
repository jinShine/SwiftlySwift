//
//  UIColor+Extension.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = nil) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a ?? 255 / 255)
  }
  
}
