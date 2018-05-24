//
//  RootNavigationController.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/12.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = UINavigationBar.appearance()
        //导航栏背景图
        //    [navBar setBackgroundImage:[UIImage imageNamed:@"tabBarBj"] forBarMetrics:UIBarMetricsDefault];
        navBar.barTintColor = kNavBgColor
        navBar.tintColor = kNavBgFontColor
        navBar.titleTextAttributes = [.foregroundColor: kNavBgFontColor, .font: kNavBgFont]
//        navigationBar.isTranslucent = true //导航栏半透明效果
//        navigationBar.setBackgroundImage(UIImage.init(color: kNavBgColor), for: .default)
//        navigationBar.shadowImage = UIImage()
        
//        navBar.setBackgroundImage(UIImage(UIColor.colorWithHexString("#2F475F")), for: .any, barMetrics: .default)
//        navBar?.shadowImage = UIImage()
       
       
        // Do any additional setup after loading the view.
        self.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RootNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController .isKind(of: RootViewController.classForCoder()) {
            let vc = viewController as! RootViewController
            if vc.isHidenNaviBar {
                var frame = vc.view.frame
                frame.origin.y = 0
                vc.view.frame = frame
                vc.navigationController?.setNavigationBarHidden(true, animated: animated)
            }else{
                var frame = vc.view.frame
                frame.origin.y = kTopHeight
                vc.view.frame = frame
                vc.navigationController?.setNavigationBarHidden(false, animated: animated)
            }
        }
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .plain, target: self, action: #selector(navigationBackClick))
            self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;
        }        
        super.pushViewController(viewController, animated: animated)

        
    }
    
    /// 返回按钮
    @objc func navigationBackClick() {
        if ((self.navigationController != nil) || (self.presentedViewController != nil ) && self.childViewControllers.count == 1) {
            _ = dismiss(animated: true, completion: nil)
            
        }else{
            _ = popViewController(animated: true)
        }
    }
   
}
