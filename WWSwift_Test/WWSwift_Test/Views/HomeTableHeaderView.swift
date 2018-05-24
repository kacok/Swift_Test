//
//  HomeTableHeaderView.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/16.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit

class HomeTableHeaderView: UIView {
    let cycleView: ZCycleView = ZCycleView()
    var marqueeLabel: LXMarqueeLabel = LXMarqueeLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        self.backgroundColor = UIColor .colorWithHexString("#F4F4F4")
        
        // 轮播图
        cycleView.placeholderImage = #imageLiteral(resourceName: "placeholder")
        cycleView.setUrlsGroup(["https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg", "https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg", "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"])
        
        cycleView.pageControlIndictirColor = UIColor.lightGray
        cycleView.pageControlCurrentIndictirColor = UIColor.white
        cycleView.pageControlAlignment = .right
        cycleView.scrollDirection = .horizontal
        cycleView.timeInterval = 3
        cycleView.delegate = self
        cycleView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kRealValue(width: 150))
        self.addSubview(cycleView)
        
        
        let textList: [String] = ["新浪手机讯", "11月16日上午消息，", "苹果公司近期推出的iOS 11测试版", "已经支持iPhone 8、8 Plus", "以及iPhone X的无线快充功能，", "但实测发现", "其实它的效果没有想象那么好。"]
        marqueeLabel.textList = textList
        marqueeLabel.textColor = UIColor.colorWithHexString("#333333")
        marqueeLabel.backgroundColor = UIColor.white
        marqueeLabel.startScrolling()
        marqueeLabel.frame = CGRect(x: kRealValue(width: 88), y: kRealValue(width: 150), width: kScreenWidth-kRealValue(width: 88), height: 44)
        self.addSubview(marqueeLabel)
        
        let iconImgaeView = UIImageView()
        iconImgaeView.contentMode = .center
        iconImgaeView.backgroundColor = UIColor.white
        iconImgaeView.image = UIImage(named: "Home_icon1")
        self.addSubview(iconImgaeView)
        iconImgaeView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.centerY.equalTo(marqueeLabel.snp.centerY)
            make.width.equalTo(kRealValue(width: 88))
            make.height.equalTo(44)
        }
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.colorWithHexString("#F4F4F4")
        
        
        
    }
}

extension HomeTableHeaderView: ZCycleViewProtocol {
    func cycleViewDidScrollToIndex(_ index: Int) {
        print("滚动%@",index)
    }
    
    func cycleViewDidSelectedIndex(_ index: Int) {
        print("点击%@",index)
    }
    
    
}
