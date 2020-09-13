//
//  UIViewController + Extension.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 23.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

extension UIViewController {
    func addObserveKeyboardNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func removeObserverKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            if view.frame.origin.y == 0 {
//                let height = keyboardSize.cgRectValue.height
//
//                self.view.frame.origin.y -= height / 3
//            }
//        }
//    }
    
    @objc func keyboardWillChange(notification: NSNotification) {
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            if view.frame.origin.y == 0 {
                let height = keyboardSize.cgRectValue.height
                
                self.view.frame.origin.y -= height / 3
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
            if view.frame.origin.y != 0 {
                
                self.view.frame.origin.y = 0
        }
    }
}
