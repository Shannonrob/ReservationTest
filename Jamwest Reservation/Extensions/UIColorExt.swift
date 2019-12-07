//
//  UIColorExt.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 12/7/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit


extension UIColor {
    
   func configureColor (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
       return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
