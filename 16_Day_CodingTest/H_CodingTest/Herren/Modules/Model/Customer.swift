//
//  Customer.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation

struct CustomerList: Decodable {
  var list: [Customer] = []
}

struct Customer: Decodable {
  var custno: Int
  var name: String
  var contact: String
  var birth: String
  var memo: String
  var dontsend: Int
  var point: Int
  var profile: Int
  var chargeName: String
  var regdate: String
  var profileUrl: String
  
  init() {
    self.custno = 0
    self.name = ""
    self.contact = ""
    self.birth = ""
    self.memo = ""
    self.dontsend = 0
    self.point = 0
    self.profile = 0
    self.chargeName = ""
    self.regdate = ""
    self.profileUrl = ""
  }
}
