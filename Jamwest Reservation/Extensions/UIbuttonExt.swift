//
//  UIbuttonExt.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 12/7/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureButtonWithIcon (_ image: String?, title: String?, titleColor: UIColor?, buttonColor: UIColor?, cornerRadius: CGFloat?) {
        
        if let image = image {
            setImage(#imageLiteral(resourceName: image).withRenderingMode(.alwaysOriginal), for: .normal)
            imageView?.contentMode = .scaleAspectFit
        }
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        if let titleColor = titleColor {
            setTitleColor(titleColor, for: .normal)
        }
        
        if let buttonColor = buttonColor {
            self.backgroundColor = buttonColor
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        semanticContentAttribute = .forceRightToLeft
        tintColor = .clear
        setTitleColor(.black, for: .selected)
    
    }
    
    func configureButton (title: String?, titleColor: UIColor?, buttonColor: UIColor?, cornerRadius: CGFloat?) {
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        if let titleColor = titleColor {
            setTitleColor(titleColor, for: .normal)
        }
        
        if let buttonColor = buttonColor {
            self.backgroundColor = buttonColor
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        
        tintColor = .clear
        setTitleColor(.black, for: .selected)
    }
    
 
    func updateButtonIcon (_ image: String?) {
        if let image = image {
            setImage(#imageLiteral(resourceName: image).withRenderingMode(.alwaysOriginal), for: .normal)
            imageView?.contentMode = .scaleAspectFit
        }
    }
    
    
    
}

