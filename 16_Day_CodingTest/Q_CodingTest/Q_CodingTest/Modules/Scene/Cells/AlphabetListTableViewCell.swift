//
//  AlphabetListTableViewCell.swift
//  Q_CodingTest
//
//  Created by Buzz.Kim on 2020/11/02.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit

class AlphabetListTableViewCell: UITableViewCell {
  
  // MARK: - UI
  
  struct UI {
    static let collectionViewColumn: CGFloat = 3
    static let footerViewHeight: CGFloat = 44
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
    collectionView.bounces = false
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = UIColor.white
    
    collectionView.register(
      AlphabetCollectionViewCell.self,
      forCellWithReuseIdentifier: AlphabetCollectionViewCell.reuseIdentifier
    )
    
    collectionView.register(
      FooterViewCollectionViewCell.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: FooterViewCollectionViewCell.reuseIdentifier
    )
    
    return collectionView
  }()
  
  // MARK: - Properties
  
  var alphabets: [String] = [] {
    didSet { reloadData() }
  }
  
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
  
  private func reloadData() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  func configure(with items: [String]) {
    self.alphabets = items
  }
  
}
