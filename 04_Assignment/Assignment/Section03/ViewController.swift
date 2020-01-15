//
//  ViewController.swift
//  Section03
//
//  Created by seungjin on 2020/01/13.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //MARK:- UI Properties

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!


  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }

  //MARK:- Methods

  private func setupUI() {
    self.nameTextField.delegate = self
    self.ageTextField.delegate = self
    self.emailTextField.delegate = self
  }

  private func dismissKeyboard() {
    view.endEditing(true)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)

    dismissKeyboard()
  }

  //MARK:- Actions

  @IBAction func move(_ sender: UIButton) {

    if let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
      secondVC.userInfo = [
        "name" : nameTextField.text ?? "",
        "age" : ageTextField.text ?? "",
        "email" : emailTextField.text ?? ""
      ]

      navigationController?.pushViewController(secondVC, animated: true)
    }
  }
}

//MARK:- Delegate

extension ViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    dismissKeyboard()

    return true
  }
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {


    // 방법 1

    switch textField {
    case nameTextField:
      let name = (nameTextField.text ?? "") + string
      nameLabel.didChangeColor(by: name.count >= 2)

    case ageTextField:
      let age = (ageTextField.text ?? "") + string
      if let age = Int(age) {
        ageLabel.didChangeColor(by: age >= 20)
      }
    case emailTextField:
      let email = (emailTextField.text ?? "") + string
      emailLabel.didChangeColor(by: email.contains("@"))
    default:
      return false
    }


    /*
     방법 2

     let name = (nameTextField.text ?? "") + string
     let age = (ageTextField.text ?? "") + string
     let email = (emailTextField.text ?? "") + string

     if textField.isEqual(nameTextField)  {
       if name.count >= 2 {
         nameLabel.textColor = .green
       } else {
         nameLabel.textColor = .red
       }
     } else if textField.isEqual(ageTextField) {
       if let age = Int(age) {
         if age >= 20 {
           ageLabel.textColor = .green
         } else {
           ageLabel.textColor = .red
         }
       }
     } else {
       if email.contains("@") {
         emailLabel.textColor = .green
       } else {
         emailLabel.textColor = .red
       }
     }
     */

    return true
  }
}
