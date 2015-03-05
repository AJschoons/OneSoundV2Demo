//
//  PartyPageViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class PartyPageViewController: UIViewController {

    private var scrollView: UIScrollView!
    private var contentPageView: UIView!
    private var memberPageView: UIView!
    
    private var navbarView: UIView!
    private let navbarHeight: CGFloat = 44
    private var navTitleLabel: UILabel!
    private var pageControl: UIPageControl!
    // To get smaller pageControl dots... https://github.com/Spaceman-Labs/SMPageControl
    private let navbarButtonSize: CGFloat = 22
    private let navbarButtonSpacing: CGFloat = 15
    
    override func loadView() {
        super.loadView()
        
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
        scrollView.contentSize = CGSize(width: viewWidth*numberOfPages, height: viewHeight - navbarHeight)
        
        // Setup content page view
        contentPageView = UIView()
        contentPageView.backgroundColor = UIColor.redColor()
        contentPageView.frame = CGRect(x: 0*viewWidth, y: 0, width: viewWidth, height: viewHeight) // start at x=0
        scrollView.addSubview(contentPageView)
        
        // Setup member page view
        memberPageView = UIView()
        memberPageView.backgroundColor = UIColor.blueColor()
        memberPageView.frame = CGRect(x: 1*viewWidth, y: 0, width: viewWidth, height: viewHeight) // start at x=viewWidth
        scrollView.addSubview(memberPageView)
        
        // Start setting up nav bar and its items
        navbarView = UIView()
        
        // Setup nav labels
        // Width is the largest size remaining after accounting for 2 nav bar buttons & spacing b/w them
        let navTitleWidth: CGFloat = viewWidth - 2*(3*navbarButtonSpacing + 2*navbarButtonSize)
        let navTitleHeight: CGFloat = 20
        var navTitleX: CGFloat = (viewWidth / 2) - (navTitleWidth / 2)
        let navTitleY: CGFloat = 8
        navTitleLabel = UILabel()
        navTitleLabel.textAlignment = NSTextAlignment.Center
        navTitleLabel.text = "A Long Party Name"
        navTitleLabel.frame = CGRect(x: navTitleX, y: navTitleY, width: navTitleWidth, height: navTitleHeight)
        navbarView.addSubview(navTitleLabel)
        
        // Setup page control
        // To get smaller pageControl dots... https://github.com/Spaceman-Labs/SMPageControl
        pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: 35, width: 0, height: 0)
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        pageControl.pageIndicatorTintColor = UIColor.darkGrayColor()
        navbarView.addSubview(pageControl)
        
        // Add the custom navigation bar to this view controller's navigation controller
        navigationController?.navigationBar.addSubview(navbarView)
        
        // Setup nav bar buttons
        let addSongButton = UIButton(frame: CGRect(x: viewWidth - navbarButtonSize - navbarButtonSpacing, y: navbarHeight/2 - navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        addSongButton.backgroundColor = UIColor.greenColor()
        addSongButton.addTarget(self, action: "onAddSongButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(addSongButton)
        
        let editPartySettingsButton = UIButton(frame: CGRect(x: viewWidth - 2*navbarButtonSize - 2*navbarButtonSpacing, y: navbarHeight/2 - navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        editPartySettingsButton.backgroundColor = UIColor.greenColor()
        editPartySettingsButton.addTarget(self, action: "onEditPartySettingsButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(editPartySettingsButton)
        
        let profileButton = UIButton(frame: CGRect(x: navbarButtonSpacing, y: navbarHeight/2 - navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        profileButton.backgroundColor = UIColor.greenColor()
        profileButton.addTarget(self, action: "onProfileButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(profileButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let viewWidth = Int(CGRectGetWidth(view.frame))
        navbarView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: Int(navbarHeight))
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
        
    }
    
    func onEditPartySettingsButton() {
        
    }
    
    func onProfileButton() {
        
    }
}

extension PartyPageViewController: UIScrollViewDelegate {
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // Set the current page after done scrolling
        let xOffset = scrollView.contentOffset.x
        if xOffset < 1 {
            pageControl.currentPage = 0
        } else {
            pageControl.currentPage = 1
        }
    }
}

