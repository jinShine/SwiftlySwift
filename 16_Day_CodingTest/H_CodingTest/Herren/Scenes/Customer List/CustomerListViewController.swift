//
//  CustomerListViewController.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation

class CustomerListViewController: BaseViewController, CustomerListViewModelAdaptor {

  //MARK:- Constant

  struct UI {

  }

  //MARK:- UI Properties


  //MARK:- Properties

  var viewModel: CustomerListViewModelAdaptor
  var navigator: Navigator


  //MARK:- Initialize

  init(viewModel: CustomerListViewModelAdaptor, navigator: Navigator) {
    self.viewModel = viewModel
    self.navigator = navigator

    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  //MARK:- Methods

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
