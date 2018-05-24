//
//  MainTabBarController.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/3/29.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let VCS = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化tabbar
        self.setUpTabBar()
        
        //添加子控制器
        self.setUpAllChildViewController()
        // Do any additional setup after loading the view.
    }
    
    
    //初始化tabbar
    func setUpTabBar() -> Void {
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = UIColor.white
    }
    
    //添加子控制器
    func setUpAllChildViewController() -> Void {
        
        self.setupChildViewController(controller: HomeViewController(), title: "首页", imageName: "tabBar_icon1_normal", seleceImageName: "tabBar_icon1_selected")
        self.setupChildViewController(controller: HangqingViewController(), title: "行情", imageName: "tabBar_icon2_normal", seleceImageName: "tabBar_icon2_selected")
        self.setupChildViewController(controller: ChiCangViewController(), title: "持仓", imageName: "tabBar_icon3_normal", seleceImageName: "tabBar_icon3_selected")
        self.setupChildViewController(controller: MineViewController(), title: "我的", imageName: "tabBar_icon4_normal", seleceImageName: "tabBar_icon4_selected")
        
        self.viewControllers = (self.VCS as! [UIViewController])
        
    }
    
    
    func setupChildViewController(controller: UIViewController, title: String, imageName: String, seleceImageName: String) -> Void {
        controller.title = title
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: seleceImageName)?.withRenderingMode(.alwaysOriginal)
      
        
        controller.tabBarItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: kCIAttributeName) : UIColor.blue,kCTFontAttributeName as NSAttributedStringKey: UIFont.systemFont(ofSize: 10)], for: .normal)
        
        controller.tabBarItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: kCIAttributeName) : UIColor.lightGray,kCTFontAttributeName as NSAttributedStringKey: UIFont.systemFont(ofSize: 10)], for: .selected)
        
        let nav = RootNavigationController(rootViewController: controller)
        VCS .add(nav)
        
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
