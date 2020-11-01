//
//  SelectedAlphabetListViewController+CollectionViewDecorator.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

// MARK: - CollectionView data source

extension SelectedAlphabetListTableViewCell: UICollectionViewDataSource {
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int) -> Int {
    return 6
  }

  public func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return configureCell(collectionView: collectionView, indexPath: indexPath)
  }

}

// MARK: - CollectionView delegate

extension SelectedAlphabetListTableViewCell: UICollectionViewDelegate {

  public func collectionView(_ collectionView: UICollectionView,
                             didSelectItemAt indexPath: IndexPath) {

  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             didDeselectItemAt indexPath: IndexPath) {

  }
  
}

extension SelectedAlphabetListTableViewCell: UICollectionViewDelegateFlowLayout {
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = (collectionView.frame.width - (App.basicLine * 2)) / UI.collectionViewColumn
    return CGSize(width: width, height: width)
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             insetForSectionAt section: Int) -> UIEdgeInsets {
    return .zero
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return App.basicLine
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return App.basicLine
  }
  
}

// MARK: - CollectionView decorator

extension SelectedAlphabetListTableViewCell: UICollectionViewDataSourcePrefetching {
  public func collectionView(_ collectionView: UICollectionView,
                             prefetchItemsAt indexPaths: [IndexPath]) {
    
  }
    
  public func collectionView(_ collectionView: UICollectionView,
                             cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
    
  }
}

// MARK: - CollectionView decorator

extension SelectedAlphabetListTableViewCell: CollectionViewDecorator {

  public func configureCell(collectionView: UICollectionView,
                            indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: AlphabetCollectionViewCell.reuseIdentifier, for: indexPath
      ) as? AlphabetCollectionViewCell else { return UICollectionViewCell() }
    
    
    return cell
  }
}
