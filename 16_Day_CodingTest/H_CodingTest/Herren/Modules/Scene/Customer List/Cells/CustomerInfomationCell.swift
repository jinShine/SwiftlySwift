//
//  CustomerInfomationCell.swift
//  Herren
//
//  Created by Buzz.Kim on 2020/10/21.
//  Copyright © 2020 jinnify. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

public class CustomerInfomationCell: UITableViewCell {
  
  // MARK: - UI
  
  struct UI {
    static let profileSize: CGSize = CGSize(width: 60, height: 60)
  }

  // MARK: - UI Properties
  
  let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 6
    view.layer.applySketchShadow(
      color: Application.color.blur, alpha: 0.16, x: 0, y: 15, blur: 55, spread: 0
    )
    return view
  }()
  
  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = Application.image.emptyProfile
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = UI.profileSize.width / 2
    imageView.layer.masksToBounds = true
    return imageView
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.font = Application.font.appleSDGothicNeoBold(size: 16)
    label.textColor = Application.color.main
    return label
  }()
  
  let contactLabel: UILabel = {
    let label = UILabel()
    label.font = Application.font.appleSDGothicNeoRegular(size: 13)
    label.textColor = Application.color.subMain
    return label
  }()
  
  let birthLabel: UILabel = {
    let label = UILabel()
    label.font = Application.font.appleSDGothicNeoRegular(size: 13)
    label.textColor = Application.color.subMain
    label.textAlignment = .right
    return label
  }()
  
  let memoView: CaptionMemoView = CaptionMemoView()
  
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
    selectionStyle = .none
    contentView.backgroundColor = .clear
    
    [containerView].forEach { contentView.addSubview($0) }
    [profileImageView, nameLabel, contactLabel, birthLabel, memoView].forEach {
      containerView.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    
    containerView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalToSuperview().offset(-10)
    }
    
    profileImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    profileImageView.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(15)
      $0.size.equalTo(UI.profileSize.width)
    }
    
    nameLabel.snp.makeConstraints {
      $0.top.equalTo(profileImageView.snp.top).offset(11)
      $0.leading.equalTo(profileImageView.snp.trailing).offset(15)
      $0.trailing.equalToSuperview().offset(-15)
    }
    
    contactLabel.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(4)
      $0.leading.equalTo(nameLabel)
    }
    
    birthLabel.snp.makeConstraints {
      $0.centerY.equalTo(contactLabel)
      $0.leading.equalTo(contactLabel.snp.trailing).offset(15)
      $0.trailing.equalToSuperview().offset(-15)
    }
    
  }
  
  func configure(with item: Customer, searchQuery: String = "") {
    
    if searchQuery == "" {
      self.nameLabel.text = item.name
      self.contactLabel.text = item.contact
    } else {
      self.nameLabel.attributedText = item.name.attributedStringWithColor([searchQuery], color: .red)
      self.contactLabel.attributedText = item.contact.attributedStringWithColor([searchQuery], color: .red)
    }
    
    if item.profileUrl.isEmpty {
      self.profileImageView.image = Application.image.emptyProfile
    } else {
      self.profileImageView.kf.setImage(with: URL(string: item.profileUrl))
    }
    
    self.birthLabel.text = item.birth
    self.memoView.text = item.memo
    updateMemoViewConstraints(by: item.memo.isEmpty)
  }
  
  private func updateMemoViewConstraints(by isEmpty: Bool) {
    memoView.isHidden = isEmpty
    
    if isEmpty {
      memoView.snp.remakeConstraints {
        $0.top.equalTo(profileImageView.snp.bottom).offset(15)
        $0.bottom.equalToSuperview()
        $0.height.equalTo(0)
      }
    } else {
      memoView.snp.remakeConstraints {
        $0.top.equalTo(profileImageView.snp.bottom).offset(10)
        $0.leading.equalTo(profileImageView)
        $0.trailing.equalTo(birthLabel)
        $0.bottom.equalToSuperview().offset(-15)
      }
    }
  }
}
