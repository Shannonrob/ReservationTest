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
        textfield.design(placeHolder: "Hotel Name", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect)
        return textfield
    }()
    
    let tourRepTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Tour Representitive", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect)
        return textfield
    }()
    
    let paxTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Pax", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect)
        return textfield
    }()
    
    let groupNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Group Name", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect)
        return textfield
    }()
    
    let tourCompanyTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Tour Company", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect)
        return textfield
    }()
    
    let vourcherTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Voucher #", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect)
        return textfield
    }()
    

//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureViewComponents()
    }
    
//    MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
//    MARK: - Helper Functions
    
    func configureUI() {

        view.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Add Reservation"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "dismiss").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
    }
    
    func configureViewComponents() {
           let leftStackView = UIStackView(arrangedSubviews: [hotelTextField,tourRepTextfield,tourCompanyTextfield])
           leftStackView.axis = .vertical
           leftStackView.spacing = 15
           leftStackView.distribution = .fillEqually
        
           let rightStackView = UIStackView(arrangedSubviews: [groupNameTextfield,paxTextfield,vourcherTextfield])
           rightStackView.axis = .vertical
           rightStackView.spacing = 15
           rightStackView.distribution = .fillEqually
           
           view.addSubview(leftStackView)
        leftStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 300, height: 200)
        
        view.addSubview(rightStackView)
        rightStackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 300, height: 200)
          
       }
    

}
