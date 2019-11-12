//
//  AddReservationVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/12/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class AddReservationVC: UIViewController {

//    MARK: - Properties
    
    let hotelTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
//    MARK: - Selectors
    
//    MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Add Waiver"
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
    }


}
