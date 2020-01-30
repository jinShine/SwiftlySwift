//
//  ViewController.swift
//  NetworkTraining
//
//  Created by seungjin on 2020/01/24.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    fetchUser()
  }
  
  // 1. 가장 기본 적인 방법
  func fetchUser() {
    let baseUrl = "https://api.github.com/"
    let path = "users"
    
    AF.request(baseUrl + path).response { (response) in
      switch response.result {
      case .success(let data):
        print(data)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

