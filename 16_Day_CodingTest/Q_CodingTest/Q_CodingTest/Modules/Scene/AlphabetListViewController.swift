//
//  AlphabetListViewController.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class AlphabetListViewController: BaseViewController {
  
  //MARK: - Constant
  
  struct Constant {
    
  }
  
  struct UI {
    
  }
  
  //MARK: - UI Properties
  
  //MARK: - Properties
  
  var viewModel: AlphabetListViewModelAdaptor
  var navigator: Navigator
  
  //MARK: - Initialize
  
  init(viewModel: AlphabetListViewModelAdaptor, navigator: Navigator) {
    self.viewModel = viewModel
    self.navigator = navigator
    
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  //MARK: - Methods
  
  override func setupUI() {
    super.setupUI()
    
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    
  }
  
  override func bind() {
    super.bind()
    
  }
  
}

//MARK: - UI

extension AlphabetListViewController {
  
}