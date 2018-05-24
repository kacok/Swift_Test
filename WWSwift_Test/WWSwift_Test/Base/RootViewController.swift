//
//  RootViewController.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/3/29.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
   public var isHidenNaviBar: Bool = false
   public var _isShowLiftBack: Bool?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kViewBgColor
        self.isShowLiftBack = true
        
        // Do any additional setup after loading the view.
    }

 
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - 懒加载tableView
   public lazy var tableView: UITableView = {
        let tabeleV = UITableView(frame: CGRect(x: 0, y: 0, width:kScreenWidth , height: kScreenHeight-kTabBarHeight), style: .plain)
     
        tabeleV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tabeleV.estimatedRowHeight = 0
        tabeleV.estimatedSectionFooterHeight = 0
        tabeleV.estimatedSectionHeaderHeight = 0
        tabeleV.scrollsToTop = true
        tabeleV.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CGFloat.leastNormalMagnitude))
        tabeleV.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CGFloat.leastNormalMagnitude))
        return tabeleV
    }()

    
    //AMRK: - 设置返回按钮
    var isShowLiftBack: Bool?{
        
        set{
            _isShowLiftBack = newValue
//            let VCCount = navigationController?.viewControllers.count
//            if _isShowLiftBack! && ((VCCount != nil && VCCount! > 1) || (navigationController?.presentingViewController) != nil)) {
//                let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
//                backButton.setImage(UIImage(named: "back_icon"), for: .normal)
//                backButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
//                self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
//                } else {
//                  self.navigationItem.hidesBackButton = true
//                let NullBar =  UIBarButtonItem(customView: UIView())
//                self.navigationItem.leftBarButtonItem = NullBar;
//            }
            
           
            
        }
        get{
            return _isShowLiftBack
        }
    }
    
    //返回按钮点击响应
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
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
