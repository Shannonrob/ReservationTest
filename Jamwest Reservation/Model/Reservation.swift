//
//  Reservation.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 1/16/20.
//  Copyright © 2020 Shannon Robinson. All rights reserved.
//

import Foundation

class Reservation {
    
    var date: String!
    var time: String!
    var group: String!
    var hotel: String!
    var pax: Int!
    var tourCompany: String!
    var tourRep: String!
    var voucherNumber: String!
    var postId: String!
    
    init(postId: String!, dictionary: Dictionary<String, AnyObject>) {
        
        self.postId = postId
        
        if let date = dictionary[reservation_Date] as? String {
            self.date = date
        }
        
        if let time = dictionary[reservation_Time] as? String {
            self.time = time
        }
        
        if let group = dictionary[group_Name] as? String {
            self.group = group
        }
        
        if let hotel = dictionary[hotel_Name] as? String {
            self.hotel = hotel
       }
        
        if let pax = dictionary[pax_Count] as? Int {
            self.pax = pax
        }
        
        if let tourCompany = dictionary[tour_Company] as? String {
            self.tourCompany = tourCompany
        }
        
        if let tourRep = dictionary[tour_Rep] as? String {
            self.tourRep = tourRep
        }
        
        if let voucherNumber = dictionary[voucher_Number] as? String {
            self.voucherNumber = voucherNumber
        }
    }
}
