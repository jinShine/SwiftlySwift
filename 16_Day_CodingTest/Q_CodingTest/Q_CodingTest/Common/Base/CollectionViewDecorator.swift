//
//  CollectionViewDecorator.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/01.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

public protocol CollectionViewDecorator {

  func configureCell(collectionView: UICollectionView,
                     indexPath: IndexPath) -> UICollectionViewCell
}
