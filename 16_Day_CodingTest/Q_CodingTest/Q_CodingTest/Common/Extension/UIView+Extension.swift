//
//  UIView+Extension.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

extension UIView {
  
  public static var reuseIdentifier: String {
    let nameSpaceClassName = NSStringFromClass(self)
    guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
      return nameSpaceClassName
    }
    return className
  }
}
