//
//  WWModel.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/18.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WWModel {
    let city: String?

    init?(jsonData: JSON) {
        self.city = jsonData["city"].string
    }

}

struct BannersModel {
    let createTime: String?
    let custom: String?
    let desc: String?
    let endTime: String?
    let lid: String?
    let img: String?
    let name: String?
    let num: String?
    let ratio: String?
    let startTime: String?
    let times: String?
    let type: String?
    let url: String?
    let wapUrl: String?
    let data: Array<Any>?



    init?(jsonData: JSON) {
        self.createTime = jsonData["createTime"].string
        self.custom = jsonData["custom"].string
        self.desc = jsonData["desc"].string
        self.endTime = jsonData["endTime"].string
        self.lid = jsonData["id"].string
        self.img = jsonData["img"].string
        self.name = jsonData["name"].string
        self.num = jsonData["num"].string
        self.ratio = jsonData["ratio"].string
        self.startTime = jsonData["startTime"].string
        self.times = jsonData["times"].string
        self.type = jsonData["type"].string
        self.url = jsonData["url"].string
        self.wapUrl = jsonData["wapUrl"].string
        self.data = jsonData["data"].array
    }

}

