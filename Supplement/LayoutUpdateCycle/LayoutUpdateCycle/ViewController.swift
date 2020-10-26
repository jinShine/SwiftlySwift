//
//  ViewController.swift
//  LayoutUpdateCycle
//
//  Created by Buzz.Kim on 2020/10/25.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  /*
   실제로 UIView가 언제 Update가 되는지 알아 보자.
   이해하기 위해서는 run loop에 대한 깊은 이해와
   UIView가 제공하는 몇몇의 메서드들과 어떤 관계성을 띄고 있는지 파악하는 것이 중요하다.
   
   
   
   */
  
  let testView: textLabel = {
    let view = textLabel()
    view.backgroundColor = .blue
    view.text = "123"
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print("# viewDidLoad")
    view.addSubview(testView)
    
    testView.translatesAutoresizingMaskIntoConstraints = false
    testView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    testView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    testView.frame = view.frame
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("# viewWillApeear")
//    testView.frame = CGRect(x: view.center.x, y: view.center.y, width: 50, height: 50)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("# viewWillLayoutSubviews")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("# viewDidLayoutSubviews")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("# viewDidAppear")
  }
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
  }


}

class textLabel: UILabel {
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 100, height: 50)
  }
}
