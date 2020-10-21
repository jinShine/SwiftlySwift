//
//  NetworkService.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol Networkable {
  
  func request<T: Decodable>(to router: HerrenRouter,
                             decoder: T.Type,
                             completion: @escaping (NetworkDataResponse) -> Void)
}

struct NetworkService: Networkable {
  
  private static let sharedManager: Alamofire.Session = {
    let configuration = URLSessionConfiguration.default
    configuration.headers = HTTPHeaders.default
    configuration.timeoutIntervalForRequest = 30
    configuration.timeoutIntervalForResource = 30
    configuration.requestCachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
    return Alamofire.Session(configuration: configuration)
  }()

  private let provider: MoyaProvider<HerrenRouter> = {
    let provider = MoyaProvider<HerrenRouter>(endpointClosure: MoyaProvider.defaultEndpointMapping,
                                              requestClosure: MoyaProvider<HerrenRouter>.defaultRequestMapping,
                                              stubClosure: MoyaProvider.neverStub,
                                              callbackQueue: nil,
                                              session: sharedManager,
                                              plugins: [],
                                              trackInflights: false)
    return provider
  }()

  func request<T: Decodable>(to router: HerrenRouter,
                             decoder: T.Type,
                             completion: @escaping (NetworkDataResponse) -> Void) {

    provider.request(router) { response in
      switch response {
      case .success(let result):
        do {
          let model = try result.data.decode(decoder)
          completion(NetworkDataResponse(json: model, result: .success, error: nil))
        } catch {
          print(error)
        }
      case .failure(let error):
        let errorJsonData = error.response?.data
        completion(NetworkError.transform(jsonData: errorJsonData))
      }
    }
  }
}
