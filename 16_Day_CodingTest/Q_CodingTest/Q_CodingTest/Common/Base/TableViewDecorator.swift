//
//  TableViewDecorator.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewDecorator {

  func configureCell(tableView: UITableView,
                     indexPath: IndexPath) -> UITableViewCell
}
