//
//  FontAndColorMacros.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/17.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit

//默认间距
let KNormalSpace = kRealValue(width: 12)

//导航栏颜色
let kNavBgColor = UIColor.colorWithHexString("#2F475F")

//导航栏字体颜色
let kNavBgFontColor = UIColor.colorWithHexString("#ffffff")

//导航栏字体
let kNavBgFont = UIFont.systemFont(ofSize: 18)


//默认页面背景颜色
let kViewBgColor = UIColor.white

//返回随机颜色
func kRandomColor() -> UIColor{
    let r = CGFloat(arc4random()%256)
    let g = CGFloat(arc4random()%256)
    let b = CGFloat(arc4random()%256)
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}

func kRGBColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}




