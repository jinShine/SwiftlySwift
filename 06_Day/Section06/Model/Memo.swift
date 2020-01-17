//
//  Memo.swift
//  Section06
//
//  Created by Seungjin on 17/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct Memo {

  var date: Date
  var content: String

  init(content: String, date: Date) {
    self.date = date
    self.content = content
  }
}
