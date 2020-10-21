//
//  CustomerListViewModel.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

protocol CustomerListViewModelAdaptor {
  var isSearching: Bool { get set }
  var searchQuery: String { get set }
  var page: Int { get }
  var size: Int { get }
  var customerList: [Customer] { get set }
  var filteredList: [Customer] { get set }
  
  func fetchCustomerInfo(page: Int, size: Int, completion: @escaping (NetworkDataResponse) -> Void)
  func loadMore(at indexPath: IndexPath, completion: @escaping (NetworkDataResponse) -> Void)
  func numberOfSections() -> Int
  func numberOfRowsInSection(section: Int) -> Int
}

class CustomerListViewModel: CustomerListViewModelAdaptor {

  //MARK: - Cell Type

  enum SectionType: Int {
    case customerInfo,
    total
  }
  
  //MARK: - Properties
  
  var isSearching: Bool = false
  var searchQuery: String = ""
  var page: Int = 1
  let size: Int = 20
  var customerList: [Customer] = []
  var filteredList: [Customer] = []
  let customerInteractor: CustomerInteractorProtocol

  //MARK: - Init
  
  init(customerInteractor: CustomerInteractorProtocol) {
    self.customerInteractor = customerInteractor
  }

  //MARK: - Methods
  
  func fetchCustomerInfo(page: Int, size: Int,
                         completion: @escaping (NetworkDataResponse) -> Void) {
    customerInteractor.fetchCustomer(page: page, size: size) { [weak self] (response) in
      guard let self = self else { return }
      guard let data = response.json as? CustomerList else {
        completion(response)
        return
      }
      
      if response.result == .success {
        self.customerList.append(contentsOf: data.list)
        self.filteredList = self.customerList
      }
      
      completion(response)
    }
  }
  
  func loadMore(at indexPath: IndexPath,
                completion: @escaping (NetworkDataResponse) -> Void) {
    
    if indexPath.row == customerList.count - 1 {
      self.page += 1
      
      fetchCustomerInfo(page: self.page, size: self.size,
                        completion: completion)
    }
  }
  
  //MARK:- data source

  func numberOfSections() -> Int {
    return SectionType.total.rawValue
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    switch SectionType(rawValue: section) {
    case .customerInfo:
      if isSearching {
        return filteredList.count
      }
      return customerList.count
    default:
      return 1
    }
  }
  
}
