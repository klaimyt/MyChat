//
//  UIView + Extension.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 22.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func addBorderWith(round: CGFloat, color: UIColor? = UIColor(named: Constants.Colors.lightGray)) {
        backgroundColor = UIColor.white
        layer.borderWidth = 1
        layer.cornerRadius = frame.size.height / round
        layer.borderColor = color?.cgColor
    }
}
