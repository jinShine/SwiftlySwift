//
//  ViewController.swift
//  WalkthroughTutorial
//
//  Created by Buzz.Kim on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    showWalkthrough()
  }

  @IBAction func didTapShow(_ sender: UIButton) {
    showWalkthrough()
  }
  
  private func showWalkthrough() {
    let storyboard = UIStoryboard(name: "Walkthrough", bundle: nil)
    if let walkthroughVC = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
      present(walkthroughVC, animated: true, completion: nil)
    }
  }
}
