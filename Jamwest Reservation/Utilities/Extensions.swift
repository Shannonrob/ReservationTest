//
//  Extensions.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/8/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
         
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}

extension UITextField{
    
    func design(placeHolder: String?, backgroundColor: UIColor?, fontSize: CGFloat?, textColor: UIColor?, borderStyle: BorderStyle?) {
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let textColor = textColor {
            self.textColor = textColor
        }
        
        if let font = fontSize {
            self.font = UIFont.systemFont(ofSize: font)
        }
        
        if placeHolder != nil {
            self.attributedPlaceholder = NSAttributedString(string: placeHolder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        }
        
        
        if let borderStyle = borderStyle {
            self.borderStyle = borderStyle
        }
    }
}
