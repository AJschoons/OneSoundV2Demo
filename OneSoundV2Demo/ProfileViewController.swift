//
//  ProfileViewController.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let ProfileViewControllerNibName = "ProfileViewController"

class ProfileViewController: UIViewController {
    //TODO: Set up this like homeVC. then finish CircleTransition to account for profile to home.
        
    private var navbarView: UIView!
    private let navbarHeight: CGFloat = 44
    private var navTitleLabel: UILabel!
    // To get smaller pageControl dots... https://github.com/Spaceman-Labs/SMPageControl
    private let navbarButtonSize: CGFloat = 22
    private let navbarButtonSpacing: CGFloat = 15
        
    var defaultNavigationControllerDelegate: UINavigationControllerDelegate?
    
    var newNavBar: UINavigationBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()

        createNavBar()

        
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onBackButton() {
        switch (UIApplication.sharedApplication().delegate as AppDelegate).appRootViewController {
        case AppRootViewController.Home:
            let homeViewController = HomeViewController()
            navigationController?.pushViewController(homeViewController, animated: true)
            break
            
        case AppRootViewController.Party:
            let partyViewController = PartyPageViewController()
            navigationController?.pushViewController(partyViewController, animated: true)
            break
        }
    }
    
    func onEditButton() {
        
        let profileEditViewController = ProfileEditViewController(nibName: ProfileEditViewControllerNibName, bundle: nil)
        let navC = UINavigationController(rootViewController: profileEditViewController)
        
        presentViewController(navC, animated: true, completion: nil)
        navbarView?.hidden = true

        updateBlur()
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
        navTitleLabel.text = "Profile"
        navTitleLabel.textColor = UIColor.whiteColor()
        navTitleLabel.frame = CGRect(x: navTitleX, y: navTitleY, width: navTitleWidth, height: navTitleHeight)
        navbarView.addSubview(navTitleLabel)
        
        // Add the custom navigation bar to this view controller's navigation controller
        //navigationController?.navigationBar.addSubview(navbarView)
        newNavBar!.addSubview(navbarView)
        
        
        // Setup nav bar buttons
        let editButton = UIButton(frame: CGRect(x: viewWidth - navbarButtonSize - navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        editButton.backgroundColor = UIColor.greenColor()
        editButton.addTarget(self, action: "onEditButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(editButton)
        
        //TODO: Make this button a circle on each VC
        let backButton = UIButton(frame: CGRect(x: navbarButtonSpacing, y: navbarHeight/2 + navbarButtonSize/2, width: navbarButtonSize, height: navbarButtonSize))
        backButton.backgroundColor = UIColor.greenColor()
        backButton.addTarget(self, action: "onBackButton", forControlEvents: UIControlEvents.TouchUpInside)
        navbarView.addSubview(backButton)

    }
    
    func updateBlur() {// -> UIImageView{
        //1 need new image context to take screenshot
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 1)
        
        //2
        self.view.drawViewHierarchyInRect(self.view.bounds, afterScreenUpdates: true)
        
        //3
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //From UIImage Effects Objective C file
        let blur = screenShot.applyLightEffect()
        
        (UIApplication.sharedApplication().delegate as AppDelegate).settingsBackgroundImage = blur
        
        //return UIImageView(image: blur)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
