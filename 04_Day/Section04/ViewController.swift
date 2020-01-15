//
//  ViewController.swift
//  Section04
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var displayLabel: UILabel!
  @IBOutlet weak var textField1: UITextField!
  @IBOutlet weak var textField2: UITextField!


  override func viewDidLoad() {
    super.viewDidLoad()

    // 2 delegate 채택
    textField1.delegate = self
    textField2.delegate = self

  }

  @IBAction func ok(_ sender: UIButton) {
    if let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
      navigationController?.pushViewController(secondVC, animated: true)
    }
  }

}

// 1: 채택
extension ViewController: UITextFieldDelegate {

  // 3: 델리게이트 기능 사용하기
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    displayLabel.text = textField1.text
    return true
  }

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

    // 어떤식으로 파라미터 데이터가 넘어오는지 확인해보기
    print(string)
    print(textField)
    print(range)


    // 방법 1
    let text = (textField.text ?? "") + string
    displayLabel.text = text


    // 방법 2
    //if let text = textField.text {
    //  self.displayLabel.text = text + string
    //} else {
    //
    //}

    return true
  }
}
