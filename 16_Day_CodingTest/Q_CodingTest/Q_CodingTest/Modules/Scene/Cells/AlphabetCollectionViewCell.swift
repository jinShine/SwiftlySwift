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
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    return label
  }()
  
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
    
    [titleLabel].forEach {
      self.contentView.addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func configure(with item: String) {
    self.titleLabel.text = item
  }

}
