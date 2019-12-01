//
//  Protocols.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

protocol HomeVcDelegate {
  
    func handleMenuToggle(forMenuOption menuOption: MenuOption?)
}

protocol AddReservationVCDelegate {
    
    func handleSelectedTourPackage(forSelectedTourPackage: String)
//    func handleSingleTourPackageSelected(forSingleTourPackage: String)
//    func handleComboDealPackageSelected(forComboDealPackage: String)
//    func handleSuperDealPackageSelected(forSuperDealPackage: String)
}
