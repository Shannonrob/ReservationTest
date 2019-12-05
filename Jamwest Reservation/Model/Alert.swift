//
//  Alert.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 12/2/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    private static func showActionSheetAlert(on vc: UIViewController, with title: String, message: String) {
        
    }
    
    static func showOverLimitComboDealTourSelections(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Exceeded Package Limit", message: "This package limits a maximum of 2 tours.")
   }
    
    static func showOverLimitSuperDealTourSelections(on vc: UIViewController) {
         showBasicAlert(on: vc, with: "Exceeded Package Limit", message: "This package limits a maximum of 3 tours.")
    }
    
}
