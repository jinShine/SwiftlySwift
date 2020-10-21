//
//  TableViewDecorator.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewDecorator {

  func configureCell(tableView: UITableView,
                     indexPath: IndexPath) -> UITableViewCell
}
