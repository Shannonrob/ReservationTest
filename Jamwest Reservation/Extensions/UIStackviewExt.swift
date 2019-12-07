//
//  UIStackviewExt.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 12/7/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

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
