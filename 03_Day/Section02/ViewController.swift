//
//  ViewController.swift
//  Section02
//
//  Created by seungjin on 2020/01/10.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var pwLabel: UILabel!
  @IBOutlet weak var idTextField: UITextField!
  @IBOutlet weak var pwTextField: UITextField!
  
  let userInfo = ["id" : "김승진", "pw" : "12345"]
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }

  private func showAlert() {
    let alertController = UIAlertController(title: "알림", message: "로그인 성공!", preferredStyle: UIAlertController.Style.actionSheet)
    let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
    let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
  @IBAction func login(_ sender: UIButton) {

    if let id = idTextField.text, let pw = pwTextField.text {
      if id == userInfo["id"] && pw == userInfo["pw"] {

        //Alert 방법
        //showAlert()

        //화면 이동 및 데이터 전달 방법
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
          secondVC.id = id
          secondVC.pw = pw
          self.present(secondVC, animated: true, completion: nil)
        }
      }
    }
  }
}

