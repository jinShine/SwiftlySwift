//
//  WalkthroughContentCell.swift
//  WalkthroughTutorial
//
//  Created by Buzz.Kim on 2020/11/13.
//

import UIKit

class WalkthroughContentCell: UICollectionViewCell {
    
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subTitleLabel: UILabel!
  
  func configure(_ image: UIImage?, title: String, subTitle: String) {
    self.imageView.image = image
    self.titleLabel.text = title
    self.subTitleLabel.text = subTitle
  }
}
