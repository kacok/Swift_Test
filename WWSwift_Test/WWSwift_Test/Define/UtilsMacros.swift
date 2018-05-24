//
//  UtilsMacros.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/16.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit


let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kNavBarHeight: CGFloat = 44.0
let kTabBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height>20 ? 83 : 49
let kTopHeight = kStatusBarHeight + kNavBarHeight


//根据ip6的屏幕来拉伸 单位pt
func kRealValue(width: CGFloat) -> CGFloat {
    let wid = width * kScreenWidth / 375.0
    return wid
}

func kRealHeightValue(height: CGFloat) -> CGFloat {
    let height = height * kScreenWidth / 375.0
    return height
}

//给view设置圆角
func ViewRadius(_ View: UIView, Radius: CGFloat) -> Void {
    View.layer.cornerRadius = Radius
    View.layer.masksToBounds = true
}




