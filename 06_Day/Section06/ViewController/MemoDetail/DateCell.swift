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
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .medium
    formatter.locale = Locale(identifier: "Ko_kr")
    if let date = date {
      self.dateLabel.text = formatter.string(from: date)
    }
  }
  
}
