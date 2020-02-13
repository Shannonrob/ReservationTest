//
//  UILabelExt.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 2/12/20.
//  Copyright © 2020 Shannon Robinson. All rights reserved.
//

import UIKit

extension UILabel {
    
    func moveUp() {
        
        let move = CABasicAnimation(keyPath: "position")
        move.duration = 0.7
        move.repeatCount = 0
        move.autoreverses = false
        
        let fromPoint = CGPoint(x: bounds.origin.x + 41, y: bounds.midY + 60)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: bounds.origin.x + 41, y: bounds.midY + 15)
        let toValue = NSValue(cgPoint: toPoint)
        
        isHidden = false
        
        move.fromValue = fromValue
        move.toValue = toValue
        
        layer.add(move, forKey: nil)
        
    }
}
