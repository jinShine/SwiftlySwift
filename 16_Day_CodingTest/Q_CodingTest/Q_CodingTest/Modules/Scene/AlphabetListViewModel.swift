//
//  AlphabetListViewModel.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

protocol AlphabetListViewModelAdaptor {
  
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
    default:
      return 1
    }
  }
  
}

