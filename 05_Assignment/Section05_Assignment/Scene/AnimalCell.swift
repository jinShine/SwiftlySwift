//
//  AnimalCell.swift
//  Section05_Assignment
//
//  Created by seungjin on 2020/01/15.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {
  
  @IBOutlet weak var thumbnail: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  func configure(with name: String) {
    thumbnail.image = UIImage(named: name)
    nameLabel.text = name
  }
}
