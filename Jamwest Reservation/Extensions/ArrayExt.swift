//
//  ArrayExt.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 12/7/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
