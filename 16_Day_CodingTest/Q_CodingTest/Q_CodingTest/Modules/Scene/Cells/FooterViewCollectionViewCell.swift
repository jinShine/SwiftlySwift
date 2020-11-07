//
//  FooterViewCollectionViewCell.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class FooterViewCollectionViewCell: UICollectionReusableView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  
  private func setupUI() {
    backgroundColor = .lightGray
  }
  
}
