//
//  CustomerInteractor.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation

protocol CustomerInteractorProtocol {
  
  func fetchCustomer(page: Int, size: Int, completion: @escaping (NetworkDataResponse) -> Void)
}

class CustomerInteractor: CustomerInteractorProtocol {
  
  let networkService: Networkable
  
  init(networkService: Networkable = NetworkService()) {
    self.networkService = networkService
  }
  
  func fetchCustomer(page: Int, size: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    networkService.request(to: .customerList(page: page, size: size),
                           decoder: CustomerList.self,
                           completion: completion)
  }
  
}
