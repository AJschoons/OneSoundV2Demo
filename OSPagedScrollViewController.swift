//
//  OSPagedScrollViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/14/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

protocol OSPagedScrollViewControllerDelegate {
  func pagedScrollViewControllerDidScrollToPage(page: Int, withViewController: UIViewController)
}

/** 
  Custom PagedViewController implementation that allows a custom UIPageControl

  Instead of the UIPageControl appearing at the bottom of the view controller,
  the delegate of this view controller can place it wherever. This is used to
  replicate the 2014-15 Twitter-styled navigation bar with the selected page 
  shown in the navigation bar.
*/
class OSPagedScrollViewController: UIViewController {
  
  /// Add each view controller to display to this array of child view controllers
  var scrollViewPages = [UIViewController]()
  
  /// View controller that will manage the custom UIPageControl
  var delegate: OSPagedScrollViewControllerDelegate?
  
  private var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupScrollView()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    // Container view controller doesn't know it's frame size until viewDidLayoutSubviews is called,
    // so set the frame and setup the pages here
    scrollView.frame = view.frame
    addScrollViewPages()
  }
  
  private func setupScrollView() {
    scrollView = UIScrollView(frame: CGRectZero)
    scrollView.backgroundColor = UIColor.clearColor()
    scrollView.pagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.delegate = self
    scrollView.bounces = false
    view.addSubview(scrollView)
  }
  
  private func addScrollViewPages() {
    let scrollViewRect = scrollView.frame
    let scrollViewWidth = scrollViewRect.width
    let scrollViewHeight = scrollViewRect.height
    let scrollViewY = scrollViewRect.origin.y
    
    var pagesCount = 0
    for scrollViewPage in scrollViewPages {
      scrollViewPage.view.frame = CGRectMake(CGFloat(pagesCount)*scrollViewWidth, scrollViewY, scrollViewWidth, scrollViewHeight)
      scrollView.addSubview(scrollViewPage.view)
      addChildViewController(scrollViewPage)
      ++pagesCount
    }
    
    scrollView.contentSize = CGSizeMake(CGFloat(pagesCount)*scrollViewWidth, scrollViewHeight)
  }
}

extension OSPagedScrollViewController: UIScrollViewDelegate {
  // MARK: UIScrollViewDelegate
  
  // Set the delegates current page after done scrolling
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    let xOffset = scrollView.contentOffset.x
    let selectedPage = Int(xOffset / scrollView.frame.width)
    delegate?.pagedScrollViewControllerDidScrollToPage(selectedPage, withViewController: scrollViewPages[selectedPage])
  }
}
