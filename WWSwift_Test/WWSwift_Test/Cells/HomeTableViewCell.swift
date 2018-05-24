//
//  HomeTableViewCell.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/16.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit
import SnapKit
class HomeTableViewCell: BaseTableViewCell {
    
    var timeLabel = UILabel()
    var topLabel = UILabel()
    var bottomeLabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        self.selectionStyle = .none
        let bgView = self.contentView
        
        let circularView = UIView()
        circularView.backgroundColor = UIColor.colorWithHexString("#F1826E")
        circularView.layer.cornerRadius = 4
        circularView.layer.masksToBounds = true
        bgView.addSubview(circularView)
        circularView.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left).offset(kRealValue(width: 12))
            make.centerY.equalTo(bgView.snp.centerY)
            make.width.equalTo(8)
            make.height.equalTo(8)
        }
        
        
        bgView.addSubview(self.topLine)
        self.topLine.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.top)
            make.centerX.equalTo(circularView.snp.centerX)
            make.bottom.equalTo(circularView.snp.centerY)
            make.width.equalTo((1))
        }
        
        
        bgView.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(bgView.snp.bottom)
            make.centerX.equalTo(circularView.snp.centerX)
            make.top.equalTo(circularView.snp.centerY)
            make.width.equalTo((1))
        }
        
        timeLabel.text = "0000-00-00"
        timeLabel.textAlignment = .right
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = UIColor.lightGray
        bgView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.topLine.snp.bottom)
            make.right.equalTo(bgView.snp.right).offset(-12)
        }
        
        topLabel.text = "资讯标题"
        topLabel.textAlignment = .left
        topLabel.font = UIFont.systemFont(ofSize: 14)
        topLabel.textColor = UIColor.black
        bgView.addSubview(topLabel)
        topLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(circularView.snp.bottom)
            make.left.equalTo(circularView.snp.right).offset(12)
        }
        
        bottomeLabel.text = "资讯内容描述资讯内容描述"
        bottomeLabel.textAlignment = .left
        bottomeLabel.font = UIFont.systemFont(ofSize: 12)
        bottomeLabel.textColor = UIColor.gray
        bgView.addSubview(bottomeLabel)
        bottomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(circularView.snp.bottom)
            make.left.equalTo(circularView.snp.right).offset(12)
            make.right.equalTo(bgView.snp.right).offset(-kScreenWidth * 0.4)
        }
    }
    
   public lazy var topLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.colorWithHexString("#F1826E")
        return line
    }()
    
   public lazy var bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.colorWithHexString("#F1826E")
        return line
    }()

}
