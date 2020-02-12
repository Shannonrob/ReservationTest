//
//  ParticipantInfoVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 2/12/20.
//  Copyright © 2020 Shannon Robinson. All rights reserved.
//

import UIKit

class ParticipantInfoVC: UIViewController {
    
//    MARK: - Properties
    
    var reservation: Reservation?
    
    
//    MARK: - TextFields
    
    let firstNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "First name", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 350, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeName"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    

//    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
    }
    

//    MARK: - Handlers
    
    @objc func handleFormValidation() {
        
    }

    
//    MARK: - Helpers Functions
    
    func configureUI() {
        
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "\(reservation?.group ?? "")'s Group"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.HeavyGreen
        
        let navigationFont = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationFont]
    }
    
    
    func configureConstraints() {
        
        view.addSubview(firstNameTextfield)
        firstNameTextfield.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 60, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    
}
