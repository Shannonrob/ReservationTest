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
    
     let hotelNameLabel: UILabel = {
    
       let label = UILabel()
       label.text = " Hotel"
        label.textColor = .darkGray
       label.font = UIFont(name: avenirNext_Demibold, size: 16)
        return label
    }()
    
    let tourRepNameLabel: UILabel = {
       
          let label = UILabel()
          label.text = " Tour Representative"
           label.textColor = .darkGray
          label.font = UIFont(name: avenirNext_Demibold, size: 16)
           return label
       }()
    
    let tourCompanyNameLabel: UILabel = {
       
          let label = UILabel()
          label.text = " Tour Company"
           label.textColor = .darkGray
          label.font = UIFont(name: avenirNext_Demibold, size: 16)
           return label
       }()
    
    let groupNameLabel: UILabel = {

          let label = UILabel()
          label.text = " Group Name"
           label.textColor = .darkGray
          label.font = UIFont(name: avenirNext_Demibold, size: 16)
           return label
       }()

    let paxCountLabel: UILabel = {

          let label = UILabel()
          label.text = " Pax"
           label.textColor = .darkGray
          label.font = UIFont(name: avenirNext_Demibold, size: 16)
           return label
       }()

    let voucherNumberLabel: UILabel = {

          let label = UILabel()
          label.text = " Voucher #"
           label.textColor = .darkGray
          label.font = UIFont(name: avenirNext_Demibold, size: 16)
           return label
       }()

    let reservationDate: UILabel = {

          let label = UILabel()
          label.text = " Date"
           label.textColor = .darkGray
          label.font = UIFont(name: avenirNext_Demibold, size: 16)
           return label
       }()

    let hotelNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Hotel", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeHotel"))
        return textfield
    }()
    
    let tourRepTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Tour Representative", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeConcierge"))
        return textfield
    }()
    
    let paxTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Pax", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeGroup.2"))
        return textfield
    }()
    
    let groupNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Group Name", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeName"))
        return textfield
    }()
    
    let tourCompanyTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Tour Company", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeBus"))
        return textfield
    }()
    
    let vourcherTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Voucher", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeNumber"))
        return textfield
    }()
    
    let reservationDateTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Date", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeDate"))
        return textfield
    }()
    

//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
        configureViewComponents()
        
        reservationDateTextfield.addTarget(self, action: #selector(dateTapped), for: .editingDidBegin)
    }
    
//    MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
//    MARK: - Helper Functions
    
    @objc func dateTapped () {
        print("Select reservation date")
    }
    
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

}

extension AddReservationVC {
    
    
    func configureViewComponents(){
        
        let hotelStackView = UIStackView(arrangedSubviews: [hotelNameLabel, hotelNameTextField])
        hotelStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        hotelStackView.axis = .vertical
        
        let tourRepStackView = UIStackView(arrangedSubviews: [tourRepNameLabel, tourRepTextfield])
        tourRepStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        tourRepStackView.axis = .vertical
        
        let tourCompanyStackView = UIStackView(arrangedSubviews: [tourCompanyNameLabel, tourCompanyTextfield])
        tourCompanyStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        tourCompanyStackView.axis = .vertical
        
        let groupNameStackView = UIStackView(arrangedSubviews: [groupNameLabel, groupNameTextfield])
        groupNameStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        groupNameStackView.axis = .vertical
        
        let paxStackView = UIStackView(arrangedSubviews: [paxCountLabel, paxTextfield])
        paxStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        paxStackView.axis = .vertical
        
        let voucherNumberStackView = UIStackView(arrangedSubviews: [voucherNumberLabel, vourcherTextfield])
        voucherNumberStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        voucherNumberStackView.axis = .vertical
        
        let dateStackView = UIStackView(arrangedSubviews: [reservationDate, reservationDateTextfield])
        dateStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        dateStackView.axis = .vertical
        
        let leftStackView = UIStackView(arrangedSubviews: [hotelStackView, tourRepStackView, tourCompanyStackView])
        leftStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 15)
        leftStackView.axis = .vertical
        
        let rightStackView = UIStackView(arrangedSubviews: [groupNameStackView, paxStackView, voucherNumberStackView, dateStackView])
        rightStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 15)
        rightStackView.axis = .vertical

        view.addSubview(leftStackView)
        leftStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 300, height: 248)
        
        view.addSubview(rightStackView)
        rightStackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 30, width: 300, height: 330)
   
    }
    
}
