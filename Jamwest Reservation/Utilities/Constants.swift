//
//  Constants.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/17/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import Foundation
import UIKit

let avenirNext_Demibold = "AvenirNext-DemiBold"
let avenirNext_Heavy = "AvenirNext-Heavy"
let helveticaNeue_Bold = "HelveticaNeue-Bold"
let avenirNext_Medium = "AvenirNext-Medium"
let avenirNext_Regular = "AvenirNext-Regular"
let single_Tour = "Single Tour"
let combo_Deal = "Combo Deal"
let super_Deal = "Super Deal"

var tour_Package_Selected = String()


struct Constants {
    
    struct Design {
        
        struct Color {
            
            struct Primary {
                static let Orange = UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)
                static let Purple = UIColor(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
            }
            
            struct Border {
                static let Orange = CGColor.init(srgbRed: 242/255, green: 125/255, blue: 15/255, alpha: 1)
                static let Purple = CGColor.init(srgbRed: 17/255, green: 16/255, blue: 38/255, alpha: 95)
                static let Blue = CGColor.init(srgbRed: 0.50, green: 0.66, blue: 0.66, alpha: 1)
            }
            
            struct Background {
                static let FadeGray = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
            }
            
            struct Hue {
                static let Green = UIColor(hue: 0.50, saturation: 0.66, brightness: 0.66, alpha: 1)
            }
            
            struct FadedHue {
                static let Green = UIColor(hue: 0.50, saturation: 0.20, brightness: 0.66, alpha: 1)
            }
        }
    }
}
