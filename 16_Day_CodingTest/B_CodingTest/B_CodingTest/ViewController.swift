//
//  ViewController.swift
//  B_CodingTest
//
//  Created by Buzz.Kim on 2020/10/13.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // 2. red, blue, yellow 3가지 사격형 컬러 변경
  enum State {
    case red,
    blue,
    yellow
    
    var color: UIColor {
      switch self {
      case .red: return .red
      case .blue: return .blue
      case .yellow: return .yellow
      }
    }
  }
  
  var stateColor: State = .red
  var rectList: [UIView] = []
  var redoList: [UIView] = []
  
  @IBOutlet weak var undoButton: UIButton!
  @IBOutlet weak var redoButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTap()
    setupUndoButton()
    setupRedoButton()
  }
  
  // 1. Tap을 한 위치에 사각형 그리기
  private func setupTap() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(makeRect))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc
  func makeRect(_ sender: UITapGestureRecognizer) {
    let rectView = UIView()
    rectView.backgroundColor = stateColor.color
    chageColor()
    
    let point = sender.location(in: self.view)
    rectView.frame = CGRect(origin: point, size: CGSize(width: 30, height: 30))
    
    view.addSubview(rectView)
    
    // 3.
    rectList.append(rectView)
    
    // 4.
    redoList.removeAll()
  }
  
  // 2. red, blue, yellow 3가지 사격형 컬러 변경
  
  private func chageColor() {
    switch stateColor {
    case .red:
      stateColor = .blue
    case .blue:
      stateColor = .yellow
    case .yellow:
      stateColor = .red
    }
  }
  
  // 3. undo
  private func setupUndoButton() {
    undoButton.addTarget(self, action: #selector(undoAction), for: .touchUpInside)
  }
  
  @objc
  func undoAction(_ sender: UIButton) {
    guard let findView = view.subviews.last(where: { $0 == rectList.last }) else { return }
    findView.removeFromSuperview()
    rectList.removeLast()
    
    // 4.
    redoList.append(findView)
  }
  
  // 4. redo (새로운 rect가 생성시 redo는 제거)
  private func setupRedoButton() {
    redoButton.addTarget(self, action: #selector(redoAction), for: .touchUpInside)
  }
  
  @objc
  func redoAction(_ sender: UIButton) {
    guard let redoView = redoList.last else { return }
    self.view.addSubview(redoView)
    rectList.append(redoView)
    redoList.removeLast()
  }


}

