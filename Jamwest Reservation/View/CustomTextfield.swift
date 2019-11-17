//
//  CustomTextfield.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/16/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class CustomTextfield: UITextField {
    
  
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let placeHolder = String()
    let backGroundColor = UIColor.red
    
    
}


//convenience init(){
//self.init(frame: .zero)
//let border = CALayer()
//    let width = CGFloat(2.0)
//    border.borderColor = UIColor.darkGray.cgColor
//    border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.height, height: frame.size.height)
//
//    border.borderWidth = width
//    layer.addSublayer(border)
//    layer.masksToBounds = true
//
//}
