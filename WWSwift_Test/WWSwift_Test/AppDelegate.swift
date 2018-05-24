//
//  AppDelegate.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/3/20.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        self.window?.rootViewController = MainTabBarController()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func getCurrentVC() -> UIViewController? {
        var result: UIViewController? = nil
        var window: UIWindow? = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.shared.windows
            for tmpWin: UIWindow in windows {
                if tmpWin.windowLevel == UIWindowLevelNormal {
                    window = tmpWin
                    break
                }
            }
        }
        let frontView: UIView? = window?.subviews[0]
        let nextResponder = frontView?.next
        if (nextResponder is UIViewController) {
            result = nextResponder as? UIViewController
        } else {
            result = window?.rootViewController
        }
        return result
    }
    
    func getCurrentUIVC() -> UIViewController? {
        let superVC: UIViewController? = getCurrentVC()
        if (superVC is UITabBarController) {
            let tabSelectVC: UIViewController? = (superVC as? UITabBarController)?.selectedViewController
            if (tabSelectVC is UINavigationController) {
                return (tabSelectVC as? UINavigationController)?.viewControllers.last
            }
            return tabSelectVC
        } else if (superVC is UINavigationController) {
            return (superVC as? UINavigationController)?.viewControllers.last
        }
        return superVC
    }

}

