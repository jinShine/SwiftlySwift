//
//  AlphabetCollectionViewCell.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class AlphabetCollectionViewCell: UICollectionViewCell {

  override var isSelected: Bool {
    didSet {
      
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  private func setupUI() {
    contentView.layer.borderColor = UIColor.black.cgColor
    contentView.layer.borderWidth = 0.5
    backgroundColor = .red
  }
  
  func configure(with item: String) {
   
  }

}
