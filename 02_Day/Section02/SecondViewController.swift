//
//  SecondViewController.swift
//  Section02
//
//  Created by Seungjin on 09/01/2020.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var nameLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    print("SecondViewController")
  }

  @IBAction func change(_ sender: UIButton) {
    nameLabel.text = "12312312312312312"
  }

}
