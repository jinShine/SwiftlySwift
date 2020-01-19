//
//  DateCell.swift
//  Section06
//
//  Created by seungjin on 2020/01/19.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
  
  @IBOutlet weak var dateLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  func configure(with date: Date?) {
    self.dateLabel.text = String(describing: date)
  }
  
}
