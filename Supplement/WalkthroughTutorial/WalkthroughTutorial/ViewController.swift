//
//  ViewController.swift
//  WalkthroughTutorial
//
//  Created by Buzz.Kim on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {

  private let backgroundColors: [UIColor] = [
    .green,
    .blue,
    .brown,
    .yellow,
    .lightGray
  ]
  
  private let pageViewController = UIPageViewController(
    transitionStyle: .scroll,
    navigationOrientation: .horizontal
  )
  
  private let pageControl: UIPageControl = {
    let pageControl = UIPageControl()
    pageControl.currentPageIndicatorTintColor = .black
    pageControl.pageIndicatorTintColor = .magenta
    return pageControl
  }()
  
  let vcList = [UIViewController(), UIViewController(), UIViewController()]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setPageViewController()
    setPageControl()
  }

  private func setPageViewController() {
    pageViewController.dataSource = self
    pageViewController.delegate = self
    
    // 처음 VC 설정
//    let firstVC = instantiateViewController(at: 0, color: backgroundColors[0])
    let firstVC = vcList.first!
    pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
    
  }
  
  private func instantiateViewController(at index: Int, color: UIColor) -> UIViewController {
    let vc = UIViewController()
    vc.view.tag = index
    vc.view.backgroundColor = color
    return vc
  }
  
  private func setPageControl() {
    pageControl.numberOfPages = backgroundColors.count
    
    view.addSubview(pageControl)
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
      pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }

}

extension ViewController: UIPageViewControllerDataSource {

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let index = vcList.firstIndex(of: viewController) else { return nil }
    
    let previousIndex = index - 1
    print(previousIndex)
    if previousIndex < 0 {
      return vcList.last
    } else {
      return vcList[previousIndex]
    }
//    guard let index = pageViewController.viewControllers?.first?.view.tag else {
//      return nil
//    }
//
//    let beforeIndex = index > 0 ? index - 1 : backgroundColors.count - 1
//
//    let beforeVC = instantiateViewController(at: beforeIndex, color: backgroundColors[beforeIndex])
//
//    return beforeVC
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let index = vcList.firstIndex(of: viewController) else { return nil }
    
    let nextIndex = index + 1
    print(nextIndex)
    if nextIndex >= vcList.count {
      return vcList.first
    } else {
      return vcList[nextIndex]
    }
//    guard let index = pageViewController.viewControllers?.first?.view.tag else {
//      return nil
//    }
//
//    let nextIndex = index + 1
//    print("nextIndex", nextIndex)
//    print("nextIndex %", nextIndex % backgroundColors.count)
//
//    let nextVC = instantiateViewController(at: nextIndex, color: backgroundColors[nextIndex])
//
//    return nextVC
  }

}

extension ViewController: UIPageViewControllerDelegate {
  
}
