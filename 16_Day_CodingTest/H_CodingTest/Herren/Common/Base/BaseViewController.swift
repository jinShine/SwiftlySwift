//
//  BaseViewController.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/20.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
  
  //MARK: - UI Properties
  
  
  //MARK: - Properties
  
  var prefersLargeTitles: Bool = false {
    didSet {
      guard let navigationBar = self.navigationController?.navigationBar else {
        return
      }
      
      navigationBar.prefersLargeTitles = prefersLargeTitles
    }
  }
  
  
  //MARK: - Initialize
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    super.init(nibName: nil, bundle: nil)
  }
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupConstraints()
    bind()
  }
  
  deinit {
    print(String(describing: self))
  }
  
  //MARK: - Methods
  
  func setupUI() {
    
  }
  
  func setupConstraints() {
    
  }
  
  func bind() {
    
  }
  
}
