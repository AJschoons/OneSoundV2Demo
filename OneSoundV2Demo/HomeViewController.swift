//
//  ViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let HomeViewControllerNibName = "HomeViewController"

class HomeViewController: UIViewController {
    private var navbarView: UIView!
    private let navbarHeight: CGFloat = 44
    private var navTitleLabel: UILabel!
    private var pageControl: UIPageControl!
    // To get smaller pageControl dots... https://github.com/Spaceman-Labs/SMPageControl
    private let navbarButtonSize: CGFloat = 22
    private let navbarButtonSpacing: CGFloat = 15
    
    var defaultNavigationControllerDelegate: UINavigationControllerDelegate?
    
    var newNavBar: UINavigationBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.grayColor()
        createNavBar()
        
        let partyButton   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        partyButton.frame = CGRectMake(self.view.center.x - 50, self.view.center.y - 25, 100, 50)
        partyButton.backgroundColor = UIColor.whiteColor()
        partyButton.layer.cornerRadius = 0.25*partyButton.bounds.width
        partyButton.setTitle("PARTY", forState: UIControlState.Normal)
        partyButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        partyButton.addTarget(self, action: "onPartyButton", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(partyButton)
        
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navbarView?.hidden = false
        
    }

    
    func onProfileButton() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func onPartyButton() {
        
        let partyPageViewController = PartyPageViewController()
        let profileViewController = ProfileViewController()
        let navC = UINavigationController(rootViewController: profileViewController)
        navC.pushViewController(partyPageViewController, animated: false)
        
        //So profile knows what to go "back" to
        (UIApplication.sharedApplication().delegate as! AppDelegate).appRootViewController = AppRootViewController.Party
        

        if let window = (UIApplication.sharedApplication().delegate as! AppDelegate).window {
        
            UIView.transitionWithView(window, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
            window.rootViewController = navC;
        }, completion: nil)
        }
        
        

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
        let navTitleY: CGFloat = (navbarHeight/2) + (navbarButtonSize/2)
        navTitleLabel = UILabel()
        navTitleLabel.textAlignment = NSTextAlignment.Center
        navTitleLabel.text = "Home"
        navTitleLabel.textColor = UIColor.whiteColor()
        navTitleLabel.frame = CGRect(x: navTitleX, y: navTitleY, width: navTitleWidth, height: navTitleHeight)
        navbarView.addSubview(navTitleLabel)
        
        // Add the custom navigation bar to this view controller's navigation controller
        //navigationController?.navigationBar.addSubview(navbarView)
        newNavBar!.addSubview(navbarView)
        
        // Setup nav bar buttons
        /*let partyButton = UIButton(frame: CGRect(x: viewWidth - navbarButtonSize - navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        partyButton.backgroundColor = UIColor.greenColor()
        
        partyButton.addTarget(self, action: "onPartyButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(partyButton)*/
        
        
        //TODO: Make this button a circle on each VC
        let profileButton = UIButton(frame: CGRect(x: navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        profileButton.backgroundColor = UIColor.greenColor()
        profileButton.layer.cornerRadius = 0.5 * profileButton.bounds.size.width
        profileButton.addTarget(self, action: "onProfileButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(profileButton)
        

    }
}
