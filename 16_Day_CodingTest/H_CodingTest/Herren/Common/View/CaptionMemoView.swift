//
//  CaptionMemoView.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

public class CaptionMemoView: UIView {
  
  // MARK: - Properties
  
  var text: String = "" {
    didSet {
      memoLabel.text = text
    }
  }

  // MARK: - UI Properties
  
  private let memoLabel: UILabel = {
    let label = UILabel()
    label.font = Application.font.appleSDGothicNeoRegular(size: 12)
    label.textColor = Application.color.caption
    label.numberOfLines = 0
    return label
  }()
  
  //MARK: - Initialize

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
    setupConstraints()
  }
  
  //MARK: - Methods
  
  private func setupUI() {
    backgroundColor = Application.color.lightWhite
    layer.cornerRadius = 6
    layer.masksToBounds = true
    
    self.addSubview(memoLabel)
  }
  
  private func setupConstraints() {
    memoLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(8)
      $0.trailing.bottom.equalToSuperview().offset(-9)
//      $0.leading.equalToSuperview().offset(9)
//      $0.trailing.equalToSuperview().offset(-9)
//      $0.bottom.equalToSuperview().offset(-8)
    }
  }
  
}
