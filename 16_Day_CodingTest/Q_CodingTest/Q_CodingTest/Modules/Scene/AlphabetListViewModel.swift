//
//  AlphabetListViewModel.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

protocol AlphabetListViewModelAdaptor {
  var alphabets: [String] { get }
  
  func numberOfSections() -> Int
  func numberOfRowsInSection(section: Int) -> Int
}

class AlphabetListViewModel: AlphabetListViewModelAdaptor {
  
  //MARK: - Section Type
  
  enum SectionType: Int {
    case selectedAlphabetList,
    alphabetList,
    total
  }
  
  //MARK: - Properties
  
  let alphabets = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  
  //MARK: - Init
  
  init() {
    
  }
  
  //MARK: - Methods
  
  //MARK:- data source

  func numberOfSections() -> Int {
    return SectionType.total.rawValue
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    switch SectionType(rawValue: section) {
    case .selectedAlphabetList:
      return 1
    case .alphabetList:
      return 1
    default:
      return 1
    }
  }
  
}

