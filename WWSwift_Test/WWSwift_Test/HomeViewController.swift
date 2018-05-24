//
//  HomeViewController.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/3/29.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import RxCocoa


class HomeViewController: RootViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "米粒微投"
        setupUI()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    // MARK: - setupUI
    func setupUI() -> Void {
        self.tableView.register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier: "HomeTableViewCell")
        self.tableView.tableHeaderView = HomeTableHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kRealValue(width: 260)))
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        
        
        
        NetWorkManager.postRequest(urlString: "http://47.96.3.201:8081/system/query/hot/activity", parameters: nil, success: { (response) in
            print(response)
        }) { (error) in
            print(error)
        }
        
 
        
      request("http://47.96.3.201:8081/system/query/hot/activity", method: .post, params: nil, dynamicParams: nil, encoding: URLEncoding.default, headers: nil).cache(true).responseCacheAndJson { (value) in
            switch value.result {
            case .success(let string):
                
                if value.isCacheData {
                    //                    self.cacheTextView.text = string
                    print(string)
                } else {
                    //                    self.textView.text = string
                    print(string)
                }
                
            case .failure(let error):
                print(error)
            }

        }
        


        func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
//        viewModel.getBanners(BannersModel.self)
//            .catchError({ (error) -> Observable<BannersModel?> in
//                print(error.localizedDescription)
//                return Observable.empty()
//            })
//            .map { $0?.startTime  }.bind(onNext: { (str) in
//                print(str ?? "default")
//            })
//            .disposed(by: disposeBag)
    }
}
}

// MARK: - tableView代理
extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = HomeTableViewCell(style: .default, reuseIdentifier: "HomeTableViewCell")
        
        if indexPath.row == 0 {
            cell.topLine.isHidden = true
        }else{
            cell.topLine.isHidden = false
        }
        
        if indexPath.row == 9 {
            cell.bottomLine.isHidden = true
        }else{
            cell.bottomLine.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HomeHeadView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kRealValue(width: 117)))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kRealValue(width: 117)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
