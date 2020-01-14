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
    
    var reservationTime = String()
    var reservationDate = String()
    
//    need to identify where are these properties used else delete
    
//    var atvSelected = false
//    var horseBackSelected = false
//    var safariSelected = false
//    var zipLineSelected = false
//    var pushKartSelected = false
//
    
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

    let voucherNumberLabel: UILabel = {

        let label = UILabel()
        label.text = " Voucher #"
        label.textColor = .darkGray
        label.font = UIFont(name: avenirNext_Demibold, size: 16)
        return label
       }()

    let reservationDateLabel: UILabel = {

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
       label.font = UIFont(name: avenirNext_Demibold, size: 26)
       return label
      }()
    
    let paxQuantityLabel: UILabel = {

        let label = UILabel()
        label.text = "Pax Quantity :"
        label.textColor = Constants.Design.Color.Primary.Purple
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
       }()
    
    let stepperValueLabel: UILabel = {

        let label = UILabel()
        label.text = ""
        label.textColor = Constants.Design.Color.Primary.Purple
        label.font = UIFont(name: helveticaNeue_Bold, size: 28)
        label.shadowColor = Constants.Design.Color.Primary.Purple
    
        return label
       }()
    
    let datePicker: UIDatePicker = {
        
        var calendar: Calendar = Calendar.current
        let currentDate: Date = Date()
        var dateComponents: DateComponents = DateComponents()
        
        calendar.timeZone = TimeZone(identifier: "EST")!
        dateComponents.calendar = calendar
        dateComponents.year = +1
        
        let maxDate: Date = calendar.date(byAdding: dateComponents, to: currentDate)!
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = .some(currentDate as Date)
        datePicker.maximumDate = maxDate
        
        datePicker.backgroundColor = .white
        datePicker.setValue(UIColor.black, forKey: "textColor")
        
        return datePicker
    }()
    

//    MARK: - Textfields
    let hotelNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Hotel", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeHotel"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .allTouchEvents)
        return textfield
    }()
    
    let tourRepTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Representative", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeConcierge"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let groupNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Name", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeName"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let tourCompanyTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Tour Company", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeBus"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let vourcherTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Voucher", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeNumber"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    let reservationDateTextfield: UITextField = {
        
        let textfield = UITextField()
        textfield.design(placeHolder: "mm/dd/yyyy", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 300, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeDate"))
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(configureDatePicker), for: .editingDidBegin)
        return textfield
    }()
    
//    MARK: - Buttons
    
    let singleTourButton: UIButton = {
         let button = UIButton(type: .system)
        button.configureButtonWithIcon("whiteCheckMark", title: single_Tour, titleColor: .white, buttonColor: Constants.Design.Color.Hue.Green, cornerRadius: 8)
         button.titleLabel?.font = .boldSystemFont(ofSize: 20)
         button.addTarget(self, action: #selector(handleSelectedTourPackage), for: .touchUpInside)
         button.isEnabled = false
         return button
        }()
        
    let comboDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.configureButtonWithIcon("hiddenCheckMark", title: combo_Deal, titleColor: .white, buttonColor: Constants.Design.Color.Hue.Green, cornerRadius: 8)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSelectedTourPackage), for: .touchUpInside)
        return button
       }()
    
    let superDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.configureButtonWithIcon("hiddenCheckMark", title: super_Deal, titleColor: .white, buttonColor: Constants.Design.Color.Hue.Green, cornerRadius: 8)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSelectedTourPackage), for: .touchUpInside)
        return button
       }()
    
    let deluxePackageButton: UIButton = {
           let button = UIButton(type: .system)
           button.configureButtonWithIcon("hiddenCheckMark", title: deluxe_Package, titleColor: .white, buttonColor: Constants.Design.Color.Hue.Green, cornerRadius: 8)
           button.titleLabel?.font = .systemFont(ofSize: 18)
           button.addTarget(self, action: #selector(handleSelectedTourPackage), for: .touchUpInside)
           return button
          }()
    
    
//    MARK: - UIStepper
    
    let paxStepper: UIStepper = {
    
        let stepper: UIStepper = UIStepper()
        stepper.tintColor = UIColor.white
        stepper.setIncrementImage(#imageLiteral(resourceName: "greenPlus").withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.setDecrementImage(#imageLiteral(resourceName: "greenMinus ").withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.minimumValue = 1
        stepper.maximumValue = 100
        stepper.value = 1
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(handleStepper), for: UIControl.Event.valueChanged)
        return stepper
    }()
    
//    Mark: - UIView
    
    let popoverView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let popoverViewController: UIViewController = {
       
        let view = UIViewController()
        return view
    }()
 

//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tour_Package_Selected = single_Tour
        configureUI()
        configureStackViewComponents()
        configurePaxStepper()
        
       let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
       view.addGestureRecognizer(tap)
        
        stepperValueLabel.text = "\((Int(paxStepper.value )))"
        textFieldDelegateStatus()

    }
    
    
//    MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleNextButton() {
        
        formatReservationTime()
        formatReservationDate()

        submitReservation()
    }
    
    @objc func configureDatePicker() {
//        Add datePicker to popover

        reservationDateTextfield.resignFirstResponder()
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolBar.barStyle = UIBarStyle.default
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(handleDateSelection))
        toolBar.barTintColor = .lightGray
        toolBar.tintColor = Constants.Design.Color.Primary.Purple
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        let datePickerSize = CGSize(width: datePicker.frame.width, height: 300)

        popoverView.addSubview(toolBar)
        popoverView.addSubview(datePicker)

        popoverViewController.view = popoverView
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.view.frame = CGRect(x: 0, y: 0, width: datePickerSize.width, height: datePickerSize.height)
        popoverViewController.preferredContentSize = datePickerSize
        popoverViewController.popoverPresentationController?.sourceView = reservationDateTextfield
        popoverViewController.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 51, width: reservationDateTextfield.bounds.width, height: 0)
        popoverViewController.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate

        toolBar.anchor(top: popoverView.topAnchor, left: popoverView.leftAnchor, bottom: nil, right: popoverView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: datePicker.frame.width, height: 60)
        datePicker.anchor(top: toolBar.bottomAnchor, left: popoverView.leftAnchor, bottom: popoverView.bottomAnchor, right: popoverView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)


        self.present(popoverViewController, animated: true, completion: nil)
    }
    
    @objc func handleDateSelection() {
    
        formatDate()
        formValidation()
    }
    
    @objc func handleStepper() {
        
        stepperValueLabel.text =  "\((Int(paxStepper.value )))"
    }
    
    @objc func handleFormValidation() {
        
       formValidation()
    }
    
    @objc func handleSelectedTourPackage(_ sender: UIButton) {

        switch sender {
            
        case singleTourButton:
            
            tour_Package_Selected = singleTourButton.currentTitle!
            singleTourButton.selectedPackageButtonState(icon: white_CheckMark, font: 20, enabled: false)
            comboDealButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            superDealButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            deluxePackageButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
 
        case comboDealButton:
            tour_Package_Selected = comboDealButton.currentTitle!
            singleTourButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            comboDealButton.selectedPackageButtonState(icon: white_CheckMark, font: 20, enabled: false)
            superDealButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            deluxePackageButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            
        case superDealButton:
            tour_Package_Selected = superDealButton.currentTitle!
            singleTourButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            comboDealButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            superDealButton.selectedPackageButtonState(icon: white_CheckMark, font: 20, enabled: false)
            deluxePackageButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            
        case deluxePackageButton:
            tour_Package_Selected = deluxePackageButton.currentTitle!
            singleTourButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            comboDealButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            superDealButton.unSelectedPackageButtonState(icon: clear_CheckMark, font: 18, enabled: true)
            deluxePackageButton.selectedPackageButtonState(icon: white_CheckMark, font: 20, enabled: false)
            
        default:
            return
        }
    }

//    MARK: - Helper Functions
    // creating reservation
    func submitReservation() {
        
        guard
           let hotel = hotelNameTextField.text,
           let group = groupNameTextfield.text,
           let voucherNumber = vourcherTextfield.text,
           let tourRep = tourRepTextfield.text,
           let tourCompany = tourCompanyTextfield.text else { return }
           let paxQuantity = paxStepper.value
        let tourPackage = tour_Package_Selected
           
        // reservation info
          let values = [ hotel_Name: hotel,
                         group_Name: group,
                         voucher_Number: voucherNumber,
                         tour_Rep: tourRep,
                         tour_Company: tourCompany,
                         pax: paxQuantity] as [String: Any]
          // post id
        let reservation = RESERVATION_REF.child(reservationDate).child(reservationTime).childByAutoId()

          // upload information to dataBase
        reservation.updateChildValues(values) { (err, ref) in
            
            guard let reservationId = reservation.key else { return }
            
            RESERVATION_TOURS_REF.updateChildValues([reservationId: tourPackage])
            
            
           let toursSelectionVC = ToursSelectionVC()
            toursSelectionVC.reservationId = reservationId
            self.present(UINavigationController(rootViewController: toursSelectionVC), animated: true, completion: nil)
        }
    }
    
    func textFieldDelegateStatus() {
        
        hotelNameTextField.delegate = self
        reservationDateTextfield.delegate = self
        groupNameTextfield.delegate = self
        tourRepTextfield.delegate = self
        vourcherTextfield.delegate = self
        tourCompanyTextfield.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           
        if hotelNameTextField.isEditing ||
           groupNameTextfield.isEditing ||
           vourcherTextfield.isEditing ||
           tourRepTextfield.isEditing ||
           tourCompanyTextfield.isEditing {
               
               reservationDateTextfield.isEnabled = false
           }
       }
       
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    
        reservationDateTextfield.isEnabled = true
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
            
        case hotelNameTextField:
            textField.resignFirstResponder()
            reservationDateTextfield.becomeFirstResponder()
        case reservationDateTextfield:
            formatDate()
            groupNameTextfield.becomeFirstResponder()
        case groupNameTextfield:
            vourcherTextfield.becomeFirstResponder()
        case vourcherTextfield:
            tourRepTextfield.becomeFirstResponder()
        case tourRepTextfield:
            tourCompanyTextfield.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
   
    func configureUI() {
        
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Add Reservation"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.HeavyGreen
        
        let reservation = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: reservation]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "whiteDismiss ").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .plain, target: self, action: #selector(handleNextButton))
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func configurePaxStepper() {
        paxStepper.tintColor = .gray
    }
    
    func formatDate() {
        //date formatter for reservation date and time selected
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        reservationDateTextfield.text = dateFormatter.string(from: datePicker.date)

        dismiss(animated: true, completion: nil)
    }
    
    func formatReservationTime() {
        // formatter for reservation time selected
        let reservationTimeFormatter = DateFormatter()
        reservationTimeFormatter.timeStyle = .short
        
        reservationTime = reservationTimeFormatter.string(from: datePicker.date)
    }
    
    func formatReservationDate() {
        // formatter for reservation time selected
        let reservationDateFormatter = DateFormatter()
        reservationDateFormatter.dateStyle = .medium

        reservationDate = reservationDateFormatter.string(from: datePicker.date)
    }
    
    func formValidation() {
        
        guard hotelNameTextField.hasText,
           reservationDateTextfield.hasText,
           groupNameTextfield.hasText,
           vourcherTextfield.hasText,
           tourRepTextfield.hasText,
           tourCompanyTextfield.hasText else {
               
           navigationItem.rightBarButtonItem?.isEnabled = false
           return
       }
       navigationItem.rightBarButtonItem?.isEnabled = true
    }
}



extension AddReservationVC {
    
//    MARK: - Textfield StackViews
    func configureStackViewComponents(){

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
        
        let voucherNumberStackView = UIStackView(arrangedSubviews: [voucherNumberLabel, vourcherTextfield])
        voucherNumberStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        voucherNumberStackView.axis = .vertical
        
        let dateStackView = UIStackView(arrangedSubviews: [reservationDateLabel, reservationDateTextfield])
        dateStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        dateStackView.axis = .vertical
        
        let leftStackView = UIStackView(arrangedSubviews: [hotelStackView, groupNameStackView, tourRepStackView])
        leftStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        leftStackView.axis = .vertical
        
        let rightStackView = UIStackView(arrangedSubviews: [dateStackView, voucherNumberStackView, tourCompanyStackView])
        rightStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        rightStackView.axis = .vertical

        view.addSubview(leftStackView)
        leftStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 300, height: 276)
        
        view.addSubview(rightStackView)
        rightStackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 30, width: 300, height: 276)
   
//        MARK: - Stepper Contraints
        
        let paxStackView = UIStackView(arrangedSubviews: [paxQuantityLabel, stepperValueLabel])
        paxStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 15)
    
        let stepperStackView = UIStackView(arrangedSubviews: [paxStackView, paxStepper])
        stepperStackView.configureStackView(alignment: .leading, distribution: .equalSpacing, spacing: 10)
        stepperStackView.axis = .vertical
        
        view.addSubview(stepperStackView)
        stepperStackView.anchor(top: leftStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        MARK: - Buttons StackViews
        
        let dealButtonsStackView = UIStackView(arrangedSubviews: [singleTourButton, comboDealButton, superDealButton, deluxePackageButton])
        dealButtonsStackView.configureStackView(alignment: nil, distribution: .fillEqually, spacing: 8)
        
        let selectPackageStackView = UIStackView(arrangedSubviews: [selectPackageLabel, dealButtonsStackView])
        selectPackageStackView.configureStackView(alignment: nil, distribution: .fillEqually, spacing: 0)
        selectPackageStackView.axis = .vertical
        
        view.addSubview(selectPackageStackView)
        selectPackageStackView.anchor(top: stepperStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 105)
    }
}

