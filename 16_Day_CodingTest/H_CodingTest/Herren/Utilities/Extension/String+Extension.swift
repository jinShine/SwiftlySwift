//
//  String+Extension.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/22.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

extension String {
  func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: self)
    for string in strings {
      let range = (self as NSString).range(of: string)
      attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    guard let characterSpacing = characterSpacing else {return attributedString}
    
    attributedString.addAttribute(
      NSAttributedString.Key.kern,
      value: characterSpacing,
      range: NSRange(location: 0, length: attributedString.length)
    )
    
    return attributedString
  }
}
