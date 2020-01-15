//
//  UILabel+Extension.swift
//  Section04_Assignment
//
//  Created by Seungjin on 15/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension UILabel {

  func didChangeColor(by condition: Bool) {
    let color = condition ? UIColor.green : UIColor.red
    self.textColor = color
  }
}
