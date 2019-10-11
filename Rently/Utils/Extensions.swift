//
//  Extensions.swift
//  Rently
//
//  Created by Rafał Dycha on 09/10/2019.
//  Copyright © 2019 Rafał Dycha. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
}

extension UITextField {
    
    func setBottomBorder(backgroundColor: UIColor, borderColor: UIColor) {
        self.layer.backgroundColor = backgroundColor.cgColor
        
        //defines the layers shadow
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = borderColor.cgColor
    }
}


extension UIView {
    func anchors(top: NSLayoutYAxisAnchor?, topPad: CGFloat,
                 bottom: NSLayoutYAxisAnchor?, bottomPad: CGFloat,
                 left: NSLayoutXAxisAnchor?, leftPad: CGFloat,
                 right: NSLayoutXAxisAnchor?, rightPad: CGFloat,
                 height: CGFloat,
                 width: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPad).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPad).isActive = true
        }
        
        if width > 0 { self.widthAnchor.constraint(equalToConstant: width).isActive = true }
        
        if height > 0 { self.heightAnchor.constraint(equalToConstant: height).isActive = true }
        
    }
    
}
