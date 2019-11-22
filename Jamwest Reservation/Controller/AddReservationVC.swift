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
    var comboDealStatus = true
    var superDealStatus = false
    var atvSelected = false
    var horseBackSelected = false
    var safariSelected = false
    var zipLineSelected = false
    
    
    
//    MARK: - Labels
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

//    MARK: - Textfields
    let hotelNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Hotel", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeHotel"))
        return textfield
    }()
    
    let tourRepTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Representative", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
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
        textfield.design(placeHolder: "Name", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
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
        textfield.design(placeHolder: "Select Date", backgroundColor: .lightText, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setIcon(#imageLiteral(resourceName: "orangeDate"))
        return textfield
    }()
    
//    MARK: - Buttons
    
    let comboDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeFillCircle", title: "Combo", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(selectedTourPackage), for: .touchUpInside)
        button.isEnabled = false
        return button
       }()
    
    let superDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeEmptyCircle", title: "Super Deal", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(selectedTourPackage), for: .touchUpInside)
        button.isSelected = false
        return button
       }()
    
    let atvTourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeEmptyCircle", title: "ATV Tour", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(atvTourSelected), for: .touchUpInside)
        return button
    }()
    
    let horseBackRidingTourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeEmptyCircle", title: "Horseback", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(horsebackTourSelected), for: .touchUpInside)
        return button
    }()
    
    let safariTourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeEmptyCircle", title: "Safari Tour", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(safariTourSelected), for: .touchUpInside)
        return button
    }()
    
    let zipLineTourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeEmptyCircle", title: "Zip Line", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(zipLineTourSelected), for: .touchUpInside)
        return button
    }()

//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
        configureStackViewComponents()

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
    
    @objc func selectedTourPackage() {
        
        comboDealStatus = !comboDealStatus
        superDealStatus = !superDealStatus

        if comboDealStatus == true && superDealStatus == false {
            comboDealButton.updateButtonIcon("orangeFillCircle")
            superDealButton.updateButtonIcon("orangeEmptyCircle")
            comboDealButton.isEnabled = false
            superDealButton.isEnabled = true
        } else {
            superDealButton.updateButtonIcon("orangeFillCircle")
            comboDealButton.updateButtonIcon("orangeEmptyCircle")
            superDealButton.isEnabled = false
            comboDealButton.isEnabled = true
        }
    }
    
    @objc func atvTourSelected() {
           atvSelected = !atvSelected
           if atvSelected == true {
               atvTourButton.updateButtonIcon("orangeFillCircle")
           } else {
               atvTourButton.updateButtonIcon("orangeEmptyCircle")
           }
       }
    
    @objc func horsebackTourSelected() {
        horseBackSelected = !horseBackSelected
        if horseBackSelected == true {
            horseBackRidingTourButton.updateButtonIcon("orangeFillCircle")
        } else {
            horseBackRidingTourButton.updateButtonIcon("orangeEmptyCircle")
        }
    }
    
    @objc func safariTourSelected() {
        safariSelected = !safariSelected
        if safariSelected == true {
            safariTourButton.updateButtonIcon("orangeFillCircle")
        } else {
            safariTourButton.updateButtonIcon("orangeEmptyCircle")
        }
    }
    
    @objc func zipLineTourSelected() {
        zipLineSelected = !zipLineSelected
        if zipLineSelected == true {
            zipLineTourButton.updateButtonIcon("orangeFillCircle")
        } else {
            zipLineTourButton.updateButtonIcon("orangeEmptyCircle")
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Add Reservation"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "dismiss").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
    }

}

extension AddReservationVC {
    
//    MARK: - Textfield StackViews
    func configureStackViewComponents(){
//        Textfields
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
   
//        MARK: - Buttons StackViews
        let bottomLeftStackview = UIStackView(arrangedSubviews: [comboDealButton, superDealButton])
        bottomLeftStackview.configureStackView(alignment: nil, distribution: .fillEqually, spacing: 8)
        
        let bottomRightStackview = UIStackView(arrangedSubviews: [atvTourButton, horseBackRidingTourButton, safariTourButton, zipLineTourButton])
        bottomRightStackview.configureStackView(alignment: nil, distribution: .fillEqually, spacing: 8)
        
        view.addSubview(bottomLeftStackview)
        bottomLeftStackview.anchor(top: leftStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
        
        view.addSubview(bottomRightStackview)
        bottomRightStackview.anchor(top: rightStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 50)
    }
}
