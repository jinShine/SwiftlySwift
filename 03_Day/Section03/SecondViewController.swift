//
//  SecondViewController.swift
//  Section03
//
//  Created by Seungjin on 10/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var pwLabel: UILabel!

  var id: String = ""
  var pw: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()

    self.idLabel.text = id
    self.pwLabel.text = pw

  }

  @IBAction func dismiss(_ sender: UIButton) {
    dismiss(animated: true, completion: {
      print("SecondViewController dismiss")
    })
  }

}
