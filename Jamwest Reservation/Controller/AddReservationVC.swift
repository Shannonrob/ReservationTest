//
//  AddReservationVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/12/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class AddReservationVC: UIViewController, UITextFieldDelegate {

//    MARK: - Properties
    var comboDealStatus = true
    var superDealStatus = false
    var atvSelected = false
    var horseBackSelected = false
    var safariSelected = false
    var zipLineSelected = false
    var pushKartSelected = false
    
    
    
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
    
    let selectPackageLabel: UILabel = {

       let label = UILabel()
       label.text = " Select group package :"
     
        label.textColor = Constants.Design.Color.Primary.Purple
       label.font = UIFont(name: avenirNext_Demibold, size: 18)
       return label
      }()

//    MARK: - Textfields
    let hotelNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Hotel", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeHotel"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        return textfield
    }()
    
    let tourRepTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Representative", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeConcierge"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        return textfield
    }()
    
    let paxTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Pax", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeGroup.2"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    let groupNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Name", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeName"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        return textfield
    }()
    
    let tourCompanyTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Tour Company", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeBus"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        return textfield
    }()
    
    let vourcherTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Voucher", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeNumber"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    let reservationDateTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Select Date", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeDate"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Orange
        return textfield
    }()
    
//    MARK: - Buttons
    
    let comboDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("whiteCheckMark", title: "Combo Deal", titleColor: .white, buttonColor: Constants.Design.Color.Hue.Green, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(selectedTourPackage), for: .touchUpInside)
        button.isEnabled = false
        return button
       }()
    
    let superDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("hiddenCheckMark", title: "Super Deal", titleColor: .white, buttonColor: Constants.Design.Color.Hue.Green, cornerRadius: 8)
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
    
    let pushKartTourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonIcon("orangeEmptyCircle", title: "Push Kart", titleColor: .black, buttonColor: .white, cornerRadius: 8)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(zipLineTourSelected), for: .touchUpInside)
        return button
    }()
    
    let selectToursButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setButtonIcon("purpleList", title: "Select reserved tours ", titleColor: Constants.Design.Color.Primary.Purple, buttonColor: nil, cornerRadius: nil)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleTourSelection), for: .touchUpInside)
        
        return button
    }()
    

//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
        configureStackViewComponents()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        reservationDateTextfield.addTarget(self, action: #selector(dateTapped), for: .editingDidBegin)
        textFieldDelegateStatus()
    }
    
    
    
//    MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func presentNextVC() {
        print("Next button pressed")
    }
    
    @objc func dateTapped () {
           print("Select reservation date")
    }
    
//    MARK: - Helper Functions
    
    func textFieldDelegateStatus() {
        
        hotelNameTextField.delegate = self
        groupNameTextfield.delegate = self
        paxTextfield.delegate = self
        tourRepTextfield.delegate = self
        vourcherTextfield.delegate = self
        tourCompanyTextfield.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        switch textField {
        case hotelNameTextField:
            groupNameTextfield.becomeFirstResponder()
        case groupNameTextfield:
            paxTextfield.becomeFirstResponder()
        case paxTextfield:
            tourRepTextfield.becomeFirstResponder()
        case tourRepTextfield:
            vourcherTextfield.becomeFirstResponder()
        case vourcherTextfield:
            tourCompanyTextfield.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
    @objc func selectedTourPackage() {
        
        comboDealStatus = !comboDealStatus
        superDealStatus = !superDealStatus

        if comboDealStatus == true && superDealStatus == false {
            comboDealButton.updateButtonIcon("whiteCheckMark")
            superDealButton.updateButtonIcon("hiddenCheckMark")
            comboDealButton.isEnabled = false
            superDealButton.isEnabled = true
        } else {
            superDealButton.updateButtonIcon("whiteCheckMark")
            comboDealButton.updateButtonIcon("hiddenCheckMark")
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
    
    @objc func pushKartTourSelected() {
        pushKartSelected = !pushKartSelected
        if pushKartSelected == true {
            pushKartTourButton.updateButtonIcon("orangeFillCircle")
        } else {
            pushKartTourButton.updateButtonIcon("orangeEmptyCircle")
        }
    }
    
    @objc func handleTourSelection() {
        print("Selecting tours")
    }
    
    func configureUI() {
//        view.backgroundColor = .white
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Add Reservation"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "dismiss").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .plain, target: self, action: #selector(presentNextVC))
        navigationItem.rightBarButtonItem?.tintColor = .white
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
        
        let leftStackView = UIStackView(arrangedSubviews: [hotelStackView, groupNameStackView, tourRepStackView, tourCompanyStackView])
        leftStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        leftStackView.axis = .vertical
        
        let rightStackView = UIStackView(arrangedSubviews: [dateStackView, paxStackView, voucherNumberStackView])
        rightStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        rightStackView.axis = .vertical

        view.addSubview(leftStackView)
        leftStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 300, height: 372)
        
        view.addSubview(rightStackView)
        rightStackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 38, paddingLeft: 0, paddingBottom: 0, paddingRight: 30, width: 300, height: 276)
   
//        MARK: - Buttons StackViews
        
        let dealButtonsStackView = UIStackView(arrangedSubviews: [comboDealButton, superDealButton])
        dealButtonsStackView.configureStackView(alignment: nil, distribution: .fillEqually, spacing: 8)
        
        let selectPackageStackView = UIStackView(arrangedSubviews: [selectPackageLabel, dealButtonsStackView])
        selectPackageStackView.configureStackView(alignment: nil, distribution: .fillEqually, spacing: 0)
        selectPackageStackView.axis = .vertical
        
        view.addSubview(selectPackageStackView)
        selectPackageStackView.anchor(top: leftStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 340, height: 100)
    }
}

