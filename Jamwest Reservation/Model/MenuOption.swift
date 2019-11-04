//
//  MenuOption.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/4/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {

    case Submit
    case Waivers
    case Reservations
    case Settings
    
    var description: String{
        switch self {
        case .Submit: return "SUBMIT EMAILS"
        case.Waivers: return "WAIVERS"
        case.Reservations: return "RESERVATIONS"
        case.Settings: return "SETTINGS"
            
        }
    }
    
    var iconImage: UIImage{
          switch self {
          case .Submit: return UIImage(named: "Email") ?? UIImage()
          case.Waivers: return UIImage(named: "Waivers") ?? UIImage()
          case.Reservations: return UIImage(named: "Calender") ?? UIImage()
          case.Settings: return UIImage(named: "Settings") ?? UIImage()
              
          }
      }
}

