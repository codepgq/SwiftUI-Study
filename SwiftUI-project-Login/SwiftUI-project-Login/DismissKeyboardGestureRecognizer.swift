//
//  DismissKeyboard.swift
//  SwiftUI-project-Login
//
//  Created by pgq on 2020/3/25.
//  Copyright © 2020 pq. All rights reserved.
//

/** 全局隐藏键盘的工具类
    优点：只用写一次就可以做到全局
    缺点：点哪里都会隐藏，哪怕是点击了TextField
 
 使用方式如下：
 在SceneDelegate中为window添加一个手势
 ` window.addGestureRecognizer(DismissKeyboardGestureRecognizer.create(target: window, delegate: self)) `
 */

import SwiftUI

class DismissKeyboardGestureRecognizer: UIGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .began
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       state = .ended
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }
    
    static func create<T: UIGestureRecognizerDelegate>(target: Any?, delegate: T) -> DismissKeyboardGestureRecognizer {
        
        let tapGesture = DismissKeyboardGestureRecognizer(target: target, action:#selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = delegate
        return tapGesture
    }
}

extension SceneDelegate: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
