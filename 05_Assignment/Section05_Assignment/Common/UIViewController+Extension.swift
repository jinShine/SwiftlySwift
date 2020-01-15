//
//  UIViewController+Extension.swift
//  Section05_Assignment
//
//  Created by seungjin on 2020/01/16.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension ViewController {
  
  func showAlert(title: String, message: String, preferredStyle: UIAlertController.Style, completion: (() -> Void)?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    alertController.addAction(okAction)
    
    present(alertController, animated: true, completion: nil)
  }
}
