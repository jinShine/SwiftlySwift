//
//  NetworkError.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation

struct ErrorModel: Decodable {
  var statusCode: Int
  var body: String
}

struct NetworkError {

  let statusCode: Int
  let message: String

  static func transform(jsonData: Data?) -> NetworkDataResponse {

    do {
      let result = try JSONDecoder().decode(ErrorModel.self, from: jsonData ?? Data())
      print(result)
      return NetworkDataResponse(json: nil,
                                 result: .failure,
                                 error: NetworkError(statusCode: result.statusCode, message: result.body))
    } catch {
      print("Decodable Error")
      return NetworkDataResponse(json: nil,
                                 result: .failure,
                                 error: NetworkError(statusCode: 0, message: "Decodable Error"))
    }
  }
}
