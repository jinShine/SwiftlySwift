//
//  MemoComposeViewController.swift
//  Section06
//
//  Created by seungjin on 2020/01/17.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController {
  
  @IBOutlet weak var contentTextView: UITextView!
  
  var addHandler: ((Memo) -> Void)?
  var memo: Memo?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  private func setupUI() {
    contentTextView.text = memo?.content
  }
  
  @IBAction func dismiss(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func save(_ sender: UIBarButtonItem) {

    guard let content = contentTextView.text,
      content.count > 0 else {
      let controller = UIAlertController(title: "알림", message: "메모를 입력해주세요", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
      controller.addAction(okAction)
      present(controller, animated: true, completion: nil)
      return
    }
    
    let memo = Memo(content: content, date: Date())
    addHandler?(memo)
    
    dismiss(animated: true, completion: nil)
  }
  
}
