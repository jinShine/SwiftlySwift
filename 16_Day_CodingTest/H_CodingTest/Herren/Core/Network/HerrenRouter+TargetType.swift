//
//  HerrenRouter+TargetType.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import Moya
import Alamofire

extension HerrenRouter: TargetType {
  
  var baseURL: URL {
    return URL(string: "http://crm-staging.gongbiz.kr/app/v2020")!
  }
  
  var path: String {
    switch self {
    case .customerList:
      return "/cust"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .customerList:
      return .get
    }
  }
  
  var sampleData: Data {
    return "data".data(using: String.Encoding.utf8)!
  }
  
  var task: Task {
    switch self {
    case let .customerList(page, size):
      return .requestParameters(parameters: [
        "page" : page,
        "size" : size
      ], encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return [
      "Content-Type" : "application/json"
    ]
  }
  
}
