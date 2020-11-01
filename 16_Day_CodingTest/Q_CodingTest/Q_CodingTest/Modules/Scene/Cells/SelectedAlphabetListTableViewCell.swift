//
//  SelectedAlphabetListTableViewCell.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class SelectedAlphabetListTableViewCell: UITableViewCell {
  
  // MARK: - UI
  
  struct UI {
    static let collectionViewColumn: CGFloat = 3
  }
  
  // MARK: - UI Properties

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.allowsMultipleSelection = true
    collectionView.allowsSelection = true
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.register(
      AlphabetCollectionViewCell.self,
      forCellWithReuseIdentifier: AlphabetCollectionViewCell.reuseIdentifier
    )
    
    return collectionView
  }()
  
  //MARK: - Initialize
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
    setupConstraints()
  }
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  //MARK: - Methods
  
  private func setupUI() {

    [collectionView].forEach {
      self.contentView.addSubview($0)
    }
    
  }
  
  private func setupConstraints() {
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func configure(with item: String) {
    
  }
  
}
