//
//  AppDelegate.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

enum AppRootViewController {
  case Home, Party
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var ncd: NavigationControllerDelegate?// = NavigationControllerDelegate()
  
  var appRootViewController = AppRootViewController.Home
  
  var settingsBackgroundImage: UIImage?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    //setupAppWindowAndViewHierarchy()
    //ncd = NavigationControllerDelegate()
    //UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    
    
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}
extension AppDelegate {
  func setupAppWindowAndViewHierarchy() {
    // Setup the front nav controller to initially have the splash screen visible with a (determined) view controller as it's rootViewController
    // By default starts at the profile page (for now)
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    //use nib, but programmatically allows custom animations
    //let hvc = HomeViewController(nibName: HomeViewControllerNibName, bundle: nil)
    //let navC = UINavigationController(rootViewController: hvc)
    
    let homeViewController = HomeViewController()
    let profileViewController = ProfileViewController()
    let navC = UINavigationController(rootViewController: profileViewController)
    navC.pushViewController(homeViewController, animated: false)
    
    window!.rootViewController = navC
    window!.makeKeyAndVisible()
    
  }
  
}


