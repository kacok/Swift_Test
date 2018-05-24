//
//  MBProgressHUD+WW.swift
//  WWSwift_Test
//
//  Created by admin  on 2018/4/18.
//  Copyright © 2018年 吴伟. All rights reserved.
//

import Foundation
import MBProgressHUD


private let hideTimes: TimeInterval = 2
extension MBProgressHUD {
    
   
    
    
   private func createMBProgressHUDview(Message: String, isWindow: Bool) -> MBProgressHUD {
        let view = isWindow ? UIApplication.shared.delegate?.window : (UIApplication.shared.delegate as! AppDelegate).getCurrentUIVC()?.view
        var hud = MBProgressHUD(for: view as! UIView )
        if hud == nil {
            hud = MBProgressHUD.showAdded(to: view as! UIView, animated: true)
        } else {
            hud?.show(animated: true)
        }
        hud?.minSize = CGSize(width: 100, height: 100)
        hud?.label.text = Message
        hud?.label.font = UIFont.systemFont(ofSize: 15)
        hud?.label.textColor = UIColor.white
        hud?.label.numberOfLines = 0
        hud?.bezelView.style = .solidColor
        hud?.bezelView.color = UIColor(white: 0, alpha: 0.9)
        hud?.removeFromSuperViewOnHide = true
        hud?.contentColor = UIColor.white
        
        return hud!
    }
    
    //MARK - SHOW TIPS
    
    func showTipMessageInWindow(message: String) -> Void {
        self.showTipMessage(message: message, isWindow: true, timer: hideTimes)
    }
    func showTipMessageinView(message: String) -> Void {
        self.showTipMessage(message: message, isWindow: false, timer: hideTimes)
    }
    
    func showTipMessage(inWindow message: String, timer aTimer: TimeInterval) -> Void {
        self.showTipMessage(message: message, isWindow: true, timer: aTimer)
    }
    
    func showTipMessage(inView message: String, timer aTimer: TimeInterval) -> Void {
        self.showTipMessage(message: message, isWindow: false, timer: aTimer)
    }
    
    func showTipMessage(message: String, isWindow: Bool, timer: TimeInterval) -> Void {
        let hud = self.createMBProgressHUDview(Message: message, isWindow: isWindow)
        hud.mode = .text
        hud.minSize = hud.label.frame.size
        hud.hide(animated: true, afterDelay: hideTimes)
        
    }
    
    
    //MARK - show Activity
    
    func showActivityMessageinWindow(message: String) -> Void {
        self.showActivityMessage(message: message, isWindow: true, timer: 0)
    }
    
    func showActivityMessageinView(message: String) -> Void {
        self.showActivityMessage(message: message, isWindow: false, timer: 0)
    }
    
    func showActivityMessageinWindow(message: String, timer aTimer: TimeInterval) -> Void {
        self.showActivityMessage(message: message, isWindow: true, timer: aTimer)
    }
    
    func showActivityMessageinView(message: String, timer aTimer: TimeInterval) -> Void {
        self.showActivityMessage(message: message, isWindow: false, timer: aTimer)
    }
    
   private func showActivityMessage(message: String, isWindow: Bool, timer aTimer: TimeInterval) -> Void {
        let hud = self.createMBProgressHUDview(Message: message, isWindow: isWindow)
        hud.mode = .annularDeterminate
        if aTimer > 0 {
            hud.hide(animated: true, afterDelay: aTimer)
        }
    }
    
    //MARK - show Image
    
    func showSuccessMessage(Message: String) -> Void {
        self.showCustomIcon(inWindow: "MBHUD_Success", message: Message)
    }
    
    func showErrorMessage(Message: String) -> Void {
        self.showCustomIcon(inWindow: "MBHUD_Error", message: Message)
    }
    
    func showInfoMessage(Message: String) -> Void {
        self.showCustomIcon(inWindow: "MBHUD_Info", message: Message)
    }
    
    func showWarnMessage(Message: String) -> Void {
        self.showCustomIcon(inWindow: "MBHUD_Warn", message: Message)
    }
    
    func showCustomIcon(inWindow iconName: String, message: String) -> Void {
        self.showCustomIcon(iconName: iconName, message: message, isWindow: true)
    }
    
    func showCustomIcon(inView iconName: String, message: String) -> Void {
        self.showCustomIcon(iconName: iconName, message: message, isWindow: false)
    }

    
    func showCustomIcon(iconName: String, message: String, isWindow: Bool) -> Void {
        let hud = self.createMBProgressHUDview(Message: message, isWindow: isWindow)
        hud.customView = UIImageView(image: UIImage(named: iconName ))
        hud.mode = .customView
        hud.hide(animated: true, afterDelay: hideTimes)
    }
    
    func hideHUD() {
        let winView = UIApplication.shared.delegate?.window as? UIView
        MBProgressHUD.hide(for: winView!, animated: true)
        MBProgressHUD.hide(for: ((UIApplication.shared.delegate as! AppDelegate).getCurrentUIVC()?.view)!, animated: true)
//        self.hideAllHUDs(for: winView, animated: true)
//        self.hideAllHUDs(forView: kAppDelegate.getCurrentUIVC().view, animated: true)
    }


}
