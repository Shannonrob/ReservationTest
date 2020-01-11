//
//  Constants.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/17/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import Firebase
import UIKit

// Database Refences
let DB_REF = Database.database().reference()
let USER_REF = DB_REF.child("users")
let RESERVATION_REF = DB_REF.child("reservations")

// Database Values
let hotel_Name = "hotel"
let group_Name = "groupName"
let reservation_Date = "reservationDate"
let voucher_Number = "voucherNum"
let tour_Rep = "tourRep"
let tour_Company = "tourComp"
let pax = "pax"

// Fonts
let avenirNext_Demibold = "AvenirNext-DemiBold"
let avenirNext_Heavy = "AvenirNext-Heavy"
let helveticaNeue_Bold = "HelveticaNeue-Bold"
let avenirNext_Medium = "AvenirNext-Medium"
let avenirNext_Regular = "AvenirNext-Regular"

// Button title
let single_Tour = "Single Tour"
let combo_Deal = "Combo Deal"
let super_Deal = "Super Deal"
let deluxe_Package = "Deluxe Pkg"

// Image name
let white_CheckMark = "whiteCheckMark"
let clear_CheckMark = "hiddenCheckMark"
let orange_Race_Flag_Icon = "orangeRaceFlagIcon"

// Notifying ToursSelectionVC which package was selected in AddReservationVC
var tour_Package_Selected = String()


struct Constants {
    
    struct Design {
        
        struct Color {
            
            struct Primary {
                static let Orange = UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)
                static let Purple = UIColor(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
//                static let HeavyGreen = UIColor(displayP3Red: 0/255, green: 162/255, blue: 138/255, alpha: 1)
                static let HeavyGreen = UIColor(displayP3Red: 0/255, green: 81/255, blue: 82/255, alpha: 1)
                static let LightPurple = UIColor(displayP3Red: 17/255, green: 16/255, blue: 95/255, alpha: 100)
                static let MenuBlue = UIColor(displayP3Red: 17/255, green: 16/255, blue: 160/255, alpha: 100)
                
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
