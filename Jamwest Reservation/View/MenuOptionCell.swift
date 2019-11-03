//
//  MenuOptionCell.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

//  MARK: - Properties
    
    //    MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor =  UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Handlers
    
    
}
