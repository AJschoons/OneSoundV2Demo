//
//  PartyPageViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let PartyPageViewControllerNibName = "PartyPageViewController"

class PartyPageViewController: UIViewController {
  /*
  private var scrollView: UIScrollView!
  
  private var navbarView: UIView!
  let navbarHeight: CGFloat = 44
  let statusBarHeight: CGFloat = 20
  private var navTitleLabel: UILabel!
  private var pageControl: UIPageControl!
  // To get smaller pageControl dots... https://github.com/Spaceman-Labs/SMPageControl
  private let navbarButtonSize: CGFloat = 22
  private let navbarButtonSpacing: CGFloat = 15
  
  var defaultNavigationControllerDelegate: UINavigationControllerDelegate?
  
  var newNavBar: UINavigationBar?
  
  private var partyPlaylistViewController: PartyPlaylistViewController!
  private var partyMembersViewController: PartyMembersViewController!
  private var partyChildViewControllers = [UIViewController]()

  /*
  override func loadView() {
    // Setup base view
    let screenRect = UIScreen.mainScreen().bounds
    let screenWidth = screenRect.size.width
    let screenHeight = screenRect.size.height
    view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    
  
    // Setup scroll view
    scrollView = UIScrollView(frame: view.frame)
    scrollView.backgroundColor = UIColor.clearColor()
    scrollView.pagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.delegate = self
    scrollView.bounces = false
    view.addSubview(scrollView)
    let viewWidth = CGRectGetWidth(view.frame)
    let viewHeight = CGRectGetHeight(view.frame)
    let numberOfPages: CGFloat = 2
    scrollView.contentSize = CGSize(width: viewWidth*numberOfPages, height: viewHeight)
    
    // Setup content page view
    partyContentViewController = PartyContentViewController()
    partyContentViewController.partyPageViewController = self
    partyContentViewController.view.backgroundColor = UIColor.redColor()
    // start at x=0
    partyContentViewController.view.frame = CGRect(x: 0*viewWidth, y: 0, width: viewWidth, height: viewHeight)
    scrollView.addSubview(partyContentViewController.view)
    
    // Setup member page view
    memberPageView = UIView()
    memberPageView.backgroundColor = UIColor.blueColor()
    memberPageView.frame = CGRect(x: 1*viewWidth, y: 0, width: viewWidth, height: viewHeight) // start at x=viewWidth
    scrollView.addSubview(memberPageView)
    
  }*/
  
  override func viewDidLoad() {
    super.viewDidLoad()
    modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    
    // Setup scroll view
    scrollView = UIScrollView(frame: view.frame)
    scrollView.backgroundColor = UIColor.clearColor()
    scrollView.pagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.delegate = self
    scrollView.bounces = false
    view.addSubview(scrollView)
    
    //
    // Setup child view controllers
    //
    
    partyPlaylistViewController = storyboard?.instantiateViewControllerWithIdentifier(PartyPlaylistStoryboardIdentifier) as! PartyPlaylistViewController
    addChildViewController(partyPlaylistViewController)
    partyChildViewControllers.append(partyPlaylistViewController)
    
    partyMembersViewController = storyboard?.instantiateViewControllerWithIdentifier(PartyMembersStoryboardIdentifier) as! PartyMembersViewController
    addChildViewController(partyMembersViewController)
    partyChildViewControllers.append(partyMembersViewController)
    
    // Add child view controllers to scroll view
    
    let scrollViewRect = scrollView.frame
    let scrollViewWidth = scrollViewRect.width
    let scrollViewHeight = scrollViewRect.height
    let scrollViewY = scrollViewRect.origin.y
    
    var pagesCount = 0
    for partyChildViewController in partyChildViewControllers {
      partyChildViewController.view.frame = CGRectMake(CGFloat(pagesCount)*scrollViewWidth, scrollViewY, scrollViewWidth, scrollViewHeight)
      scrollView.addSubview(partyChildViewController.view)
      ++pagesCount
    }
    
    scrollView.contentSize = CGSizeMake(CGFloat(pagesCount)*scrollViewWidth, scrollViewHeight)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {

  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
  func onAddSongButton() {
    navbarView?.hidden = true
    let addSongViewController = AddSongViewController(nibName: AddSongViewControllerNibName, bundle: nil)
    let navC = UINavigationController(rootViewController: addSongViewController)
    presentViewController(navC, animated: true, completion: nil)
    
    updateBlur()
    
  }
  
  func onEditPartySettingsButton() {
    navbarView?.hidden = true
    let partyEditViewController = PartyEditViewController(nibName: PartyEditViewControllerNibName, bundle: nil)
    let navC = UINavigationController(rootViewController: partyEditViewController)
    presentViewController(navC, animated: true, completion: nil)
    
    updateBlur()
    
  }
  
  func onProfileButton() {
    
    navigationController?.popViewControllerAnimated(true)
    
    
  }
  
  func createNavBar() {
    //1. hide Nav Bar
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    // 2. create a new nav bar and style it
    newNavBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(self.view.bounds), height: 64.0))
    // Sets background to a blank/empty image
    //newNavBar!.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    //newNavBar!.translucent = true
    
    // 3. add a new navigation item w/title to the new nav bar
    //UINavigationItem *newItem = [[UINavigationItem alloc] init];
    //newItem.title = @"Paths";
    //[newNavBar setItems:@[newItem]];
    
    // 4. add the nav bar to the main view
    //[self.view addSubview:newNavBar];
    view.addSubview(newNavBar!)
    
    let viewWidth = CGRectGetWidth(view.frame)
    let viewHeight = CGRectGetHeight(view.frame)
    
    // Start setting up nav bar and its items
    navbarView = UIView()
    
    // Setup nav labels
    // Width is the largest size remaining after accounting for 2 nav bar buttons & spacing b/w them
    let navTitleWidth: CGFloat = viewWidth - 2*(3*navbarButtonSpacing + 2*navbarButtonSize)
    let navTitleHeight: CGFloat = 20
    var navTitleX: CGFloat = (viewWidth / 2) - (navTitleWidth / 2)
    let navTitleY: CGFloat = (navbarHeight/2) + (navbarButtonSize/2)//8
    navTitleLabel = UILabel()
    navTitleLabel.textAlignment = NSTextAlignment.Center
    navTitleLabel.text = "A Long Party Name"
    navTitleLabel.frame = CGRect(x: navTitleX, y: navTitleY, width: navTitleWidth, height: navTitleHeight)
    navbarView.addSubview(navTitleLabel)
    
    // Setup page control
    // To get smaller pageControl dots... https://github.com/Spaceman-Labs/SMPageControl
    pageControl = UIPageControl()
    pageControl.frame = CGRect(x: 0, y: 55, width: 0, height: 0) //y:35
    pageControl.numberOfPages = 2
    pageControl.currentPage = 0
    pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
    pageControl.pageIndicatorTintColor = UIColor.darkGrayColor()
    navbarView.addSubview(pageControl)
    
    // Add the custom navigation bar to this view controller's navigation controller
    //navigationController?.navigationBar.addSubview(navbarView)
    newNavBar!.addSubview(navbarView)
    
    // Setup nav bar buttons
    let addSongButton = UIButton(frame: CGRect(x: viewWidth - navbarButtonSize - navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
    addSongButton.backgroundColor = UIColor.greenColor()
    addSongButton.addTarget(self, action: "onAddSongButton", forControlEvents: UIControlEvents.TouchUpInside)
    navbarView.addSubview(addSongButton)
    
    let editPartySettingsButton = UIButton(frame: CGRect(x: viewWidth - 2*navbarButtonSize - 2*navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
    editPartySettingsButton.backgroundColor = UIColor.greenColor()
    editPartySettingsButton.addTarget(self, action: "onEditPartySettingsButton", forControlEvents: UIControlEvents.TouchUpInside)
    navbarView.addSubview(editPartySettingsButton)
    
    let profileButton = UIButton(frame: CGRect(x: navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
    profileButton.backgroundColor = UIColor.greenColor()
    profileButton.layer.cornerRadius = 0.5 * profileButton.bounds.size.width
    profileButton.addTarget(self, action: "onProfileButton", forControlEvents: UIControlEvents.TouchUpInside)
    navbarView.addSubview(profileButton)
  }
  func updateBlur() {
    //1 need new image context to take screenshot
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 1)
    
    //2
    self.view.drawViewHierarchyInRect(self.view.bounds, afterScreenUpdates: true)
    
    //3
    let screenShot = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    //From UIImage Effects Objective C file
    let blur = screenShot.applyLightEffect()
    
    (UIApplication.sharedApplication().delegate as! AppDelegate).settingsBackgroundImage = blur
  }
}

extension PartyPageViewController: UIScrollViewDelegate {
  // MARK: UIScrollViewDelegate
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    
    // Set the current page after done scrolling
    let xOffset = scrollView.contentOffset.x
    if xOffset < 1 {
      //pageControl.currentPage = 0
    } else {
      //pageControl.currentPage = 1
    }
  }*/
}

