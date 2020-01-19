//
//  ContentCell.swift
//  Section06
//
//  Created by seungjin on 2020/01/19.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {
  
  @IBOutlet weak var contentLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func configure(with content: String?) {
    self.contentLabel.text = content
  }
  
}
