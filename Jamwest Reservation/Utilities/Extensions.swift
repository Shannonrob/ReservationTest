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
    
    
    
//    func bindToKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//    
//    @objc func keyboardWillChangeFrame(_ notification: NSNotification) {
//        
//        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
//        let beginningFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let deltaY = endFrame.origin.y - beginningFrame.origin.y
//        
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
//            self.frame.origin.y += deltaY
//        }, completion: nil)
//    }
}


extension UITextField {
    
    func design(placeHolder: String?, backgroundColor: UIColor?, fontSize: CGFloat?, textColor: UIColor?, borderStyle: BorderStyle?, width: CGFloat, height: CGFloat) {
        
        
        
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
            self.attributedPlaceholder = NSAttributedString(string: placeHolder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        }
        
        if let borderStyle = borderStyle {
            self.borderStyle = borderStyle
        }
        
        if width != 0 {
               widthAnchor.constraint(equalToConstant: width).isActive = true
           }
               
           if height != 0 {
               heightAnchor.constraint(equalToConstant: height).isActive = true
           }
        
    }
    
    func setTextfieldIcon(_ image: UIImage) {
        
        let iconView = UIImageView(frame: CGRect(x: -10, y: 0, width: 50, height: 50))
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 50, height: 50))
        iconContainerView.addSubview(iconView)
        
        rightView = iconContainerView
        rightViewMode = .unlessEditing
        
    }
}

extension UIButton {
    
    func setButtonIcon (_ image: String?, title: String?, titleColor: UIColor?, buttonColor: UIColor?, cornerRadius: CGFloat?) {
        
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
    
 
    func updateButtonIcon (_ image: String?) {
        if let image = image {
            setImage(#imageLiteral(resourceName: image).withRenderingMode(.alwaysOriginal), for: .normal)
            imageView?.contentMode = .scaleAspectFit
        }
    }
    
    
    
}




extension UIStackView {
    
    func configureStackView (alignment: Alignment?, distribution: Distribution?, spacing: CGFloat?) {
        
        if let alignment = alignment {
            self.alignment = alignment
        }
        if let distribution = distribution {
            self.distribution = distribution
        }
        
        if let spacing = spacing {
            self.spacing = spacing
        }
    }
}

extension UIColor {
    
   func configureColor (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
       return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}


extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
