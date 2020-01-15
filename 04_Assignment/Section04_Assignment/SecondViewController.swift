//
//  SecondViewController.swift
//  Section04_Assignment
//
//  Created by Seungjin on 14/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  //MARK:- UI Properties

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!

  //MARK:- Properties

  var userInfo: [String: String] = [:]

  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

  //MARK:- Methods

  func setupUI() {
    nameLabel.text = userInfo["name"]
    ageLabel.text = userInfo["age"]
    emailLabel.text = userInfo["email"]
  }

}
