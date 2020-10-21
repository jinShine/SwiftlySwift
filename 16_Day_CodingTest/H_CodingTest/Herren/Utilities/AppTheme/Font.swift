//
//  Font.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

struct Font {
  
  func appleSDGothicNeoRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "AppleSDGothicNeo-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func appleSDGothicNeoBold(size: CGFloat) -> UIFont {
    return UIFont(name: "AppleSDGothicNeo-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }
}
