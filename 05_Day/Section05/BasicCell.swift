//
//  BasicCell.swift
//  Section05
//
//  Created by Seungjin on 15/01/2020.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}
