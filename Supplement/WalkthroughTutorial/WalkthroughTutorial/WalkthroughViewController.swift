//
//  WalkthroughViewController.swift
//  WalkthroughTutorial
//
//  Created by Buzz.Kim on 2020/11/13.
//

import UIKit

class WalkthroughViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  
  var pageImages = [
    "onboarding-1",
    "onboarding-2",
    "onboarding-3"
  ]
  
  var pageHeadings = [
    "CREATE YOUR OWN FOOD GUIDE",
    "SHOW YOU THE LOCATION",
    "DISCOVER GREAT RESTAURANTS"
  ]
  
  var pageSubHeadings = [
    "Pin your favorite restaurants and create your own food guide",
    "Search and locate your favourite restaurant on Maps",
    "Find restaurants shared by your friends and other foodies"
  ]
  
  var currentIndex: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
    setupPageControl()
  }
  
  @IBAction func didTapNext(_ sender: UIButton) {
    guard currentIndex < 2 else { return }
    currentIndex += 1
    self.forwardPage(at: currentIndex)
  }
  
  @IBAction func didTapSkip(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupPageControl() {
    pageControl.numberOfPages = pageImages.count
    pageControl.currentPage = 0
  }
  
  private func forwardPage(at index: Int) {
    let indexPath = IndexPath(item: index, section: 0)
    pageControl.currentPage = index
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
}

extension WalkthroughViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pageImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkthroughContentCell", for: indexPath) as! WalkthroughContentCell
    
    cell.configure(UIImage(named: pageImages[indexPath.item]),
                   title: pageHeadings[indexPath.item],
                   subTitle: pageSubHeadings[indexPath.item])
    
    return cell
  }

}

extension WalkthroughViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension WalkthroughViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let index = Int(scrollView.contentOffset.x / self.collectionView.frame.width)
    
    self.currentIndex = index
    
    self.pageControl.currentPage = self.currentIndex
  }
}
