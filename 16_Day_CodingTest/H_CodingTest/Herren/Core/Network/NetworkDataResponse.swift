//
//  NetworkDataResponse.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation

enum NetworkResult {
  case success,
  failure
}

struct NetworkDataResponse {
  let json: Decodable?
  let result: NetworkResult
  let error: NetworkError?
}
