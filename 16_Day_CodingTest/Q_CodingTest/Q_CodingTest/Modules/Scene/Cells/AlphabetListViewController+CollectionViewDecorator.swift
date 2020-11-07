//
//  AlphabetListViewController+CollectionViewDecorator.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

// MARK: - CollectionView data source

extension AlphabetListTableViewCell: UICollectionViewDataSource {
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int) -> Int {
    return alphabets.count
  }

  public func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return configureCell(collectionView: collectionView, indexPath: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      let headerView = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: FooterViewCollectionViewCell.reuseIdentifier,
        for: indexPath
      )
      
      return headerView
    default:
      return UICollectionReusableView()
    }
  }
}

// MARK: - CollectionView delegate

extension AlphabetListTableViewCell: UICollectionViewDelegate {

  public func collectionView(_ collectionView: UICollectionView,
                             didSelectItemAt indexPath: IndexPath) {

  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             didDeselectItemAt indexPath: IndexPath) {

  }
}

extension AlphabetListTableViewCell: UICollectionViewDelegateFlowLayout {
  
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
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: UI.footerViewHeight)
  }
  
}

// MARK: - CollectionView decorator

extension AlphabetListTableViewCell: UICollectionViewDataSourcePrefetching {
  public func collectionView(_ collectionView: UICollectionView,
                             prefetchItemsAt indexPaths: [IndexPath]) {
    
  }
    
  public func collectionView(_ collectionView: UICollectionView,
                             cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
    
  }
}

// MARK: - CollectionView decorator

extension AlphabetListTableViewCell: CollectionViewDecorator {

  public func configureCell(collectionView: UICollectionView,
                            indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: AlphabetCollectionViewCell.reuseIdentifier, for: indexPath
      ) as? AlphabetCollectionViewCell else { return UICollectionViewCell() }
    
    cell.configure(with: alphabets[indexPath.item])
    
    return cell
  }
}

