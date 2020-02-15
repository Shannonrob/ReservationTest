//
//  ParticipantInfoVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 2/12/20.
//  Copyright © 2020 Shannon Robinson. All rights reserved.
//

import UIKit

class ParticipantInfoVC: UIViewController, UITextFieldDelegate {
    
//    MARK: - Properties
    
    var reservation: Reservation?
    var groupCounter = [Int]()
    var selectedGroupCount: String?
    
//    let countries =  ["India", "China", "United States"].sorted()
    
    
//    MARK: - TextFields
    
    let firstNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "First name", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 400, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeName"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let lastNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Last name", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 400, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeName"))
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Email", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 400, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeEmail "))
        textfield.keyboardType = .emailAddress
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let countryTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Country", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 235, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeCountry "))
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handlePickerView), for: .editingChanged)
        return textfield
    }()
    
    let phoneNumberTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "Phone number", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 400, height: 51)
        textfield.keyboardType = .phonePad
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangePhone "))
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let dateTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: nil, backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 400, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeDate"))
        textfield.isEnabled = false
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
        return textfield
    }()
    
    let groupCountTextfield: UITextField = {
        let textfield = UITextField()
        textfield.design(placeHolder: "1", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 140, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeGroup"))
        textfield.allowsEditingTextAttributes = false
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handlePickerView), for: .editingDidBegin)
        return textfield
    }()
    
    
    
//    MARK: - Labels
    
    let firstNameLabel: UILabel = {

     let label = UILabel()
     label.text = " First name"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    let lastNameLabel: UILabel = {

     let label = UILabel()
     label.text = " Last name"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    let emailLabel: UILabel = {

     let label = UILabel()
     label.text = " Email"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    let countryLabel: UILabel = {

     let label = UILabel()
     label.text = " Country"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    let phoneNumberLabel: UILabel = {

     let label = UILabel()
     label.text = " Phone number"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    let dateLabel: UILabel = {
        
     let label = UILabel()
     label.text = " Date"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    let groupCountLabel: UILabel = {
        
     let label = UILabel()
     label.text = " Group Count"
     label.textColor = .darkGray
     label.font = UIFont(name: avenirNext_Demibold, size: 16)
     return label
    }()
    
    
//    MARK: - Picker
    
    let groupCountPicker: UIPickerView = {
       
        let picker = UIPickerView()
        picker.backgroundColor = .white
        picker.setValue(UIColor.black, forKey: "textColor")
        return picker
    }()
    
    
//    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        
        firstNameTextfield.becomeFirstResponder()
        
        textFieldDelegates()
        getCurrentDate(textField: dateTextfield)
        
        groupCountPicker.delegate = self
        groupCountPicker.dataSource = self
        
        groupCounterLoop()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
//    MARK: - Handlers
    
    @objc func handleFormValidation() {
        
    }
    
    @objc func handlePickerView(textfield: UITextField) {
        
//        let selectedTextfield = UITextField()
//        
//        switch textfield {
//        case countryTextfield:
//            print("country textfield tapped")
//        case groupCountTextfield:
//            
//            groupCountTextfield.resignFirstResponder()
//            selectedTextfield = groupCountTextfield
//            print("group count textfield tapped")
//        default:
//            break
//        }
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolBar.barStyle = UIBarStyle.default
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(handleSelectedGroupCount))
        toolBar.barTintColor = .lightGray
        toolBar.tintColor = Constants.Design.Color.Primary.HeavyGreen
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        // the dimensions of the pickerview size
        let groupCountPickerSize = CGSize(width: (groupCountTextfield.frame.width) - 20, height: 200)
        let popoverView = UIView()
        popoverView.backgroundColor = .white
        let popoverViewController = UIViewController()
    
        popoverView.addSubview(toolBar)
        popoverView.addSubview(groupCountPicker)

        popoverViewController.view = popoverView
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.view.frame = CGRect(x: 0, y: 0, width: groupCountPickerSize.width, height: groupCountPickerSize.height)
        popoverViewController.preferredContentSize = groupCountPickerSize
        popoverViewController.popoverPresentationController?.sourceView = groupCountTextfield
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        popoverViewController.popoverPresentationController?.sourceRect = CGRect(x: (groupCountTextfield.bounds.width) / 2, y: groupCountTextfield.bounds.height + 1, width: 0, height: 0)
        popoverViewController.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate

        toolBar.anchor(top: popoverView.topAnchor, left: popoverView.leftAnchor, bottom: nil, right: popoverView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: groupCountPicker.frame.width, height: 60)
        groupCountPicker.anchor(top: toolBar.bottomAnchor, left: popoverView.leftAnchor, bottom: popoverView.bottomAnchor, right: popoverView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        self.present(popoverViewController, animated: true, completion: nil)
    }
    
    @objc func handleSelectedGroupCount() {
        
        groupCountTextfield.text = selectedGroupCount
    // add form validation here for checking if group count textfield has text
        
        dismiss(animated: true, completion: nil)
    }

    
//    MARK: - Helpers Functions
    
    func groupCounterLoop() {
        
        for numbers in 1...99 {
            
            self.groupCounter.append(numbers)
        }
        
    }
    
    func textFieldDelegates() {
        
        firstNameTextfield.delegate = self
        lastNameTextfield.delegate = self
        phoneNumberTextfield.delegate = self
        emailTextfield.delegate = self
        countryTextfield.delegate = self
        dateTextfield.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
            
        case firstNameTextfield:
            lastNameTextfield.becomeFirstResponder()
        case lastNameTextfield:
            phoneNumberTextfield.becomeFirstResponder()
        case phoneNumberTextfield:
            emailTextfield.becomeFirstResponder()
        case emailTextfield:
            countryTextfield.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           
        if firstNameTextfield.isEditing ||
           lastNameTextfield.isEditing ||
           phoneNumberTextfield.isEditing ||
           emailTextfield.isEditing ||
           countryTextfield.isEditing {
           groupCountTextfield.isEnabled = false
           }
       }
    
//    //checking if countries of group count textfield was tapped
//    func textfieldGestureCheck(_ textField: UITextField) {
//
//        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
//        view.addGestureRecognizer(tap)
//    }
       
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    
        groupCountTextfield.isEnabled = true
        return true
    }
    
    func getCurrentDate(textField: UITextField) {
        
        var calendar: Calendar = Calendar.current
        let currentDate: Date = Date()
        var dateComponents: DateComponents = DateComponents()

        calendar.timeZone = TimeZone(identifier: "EST")!
        dateComponents.calendar = calendar
        
        let currentDateFormatter = DateFormatter()
        currentDateFormatter.dateStyle = .medium
        
        textField.text = currentDateFormatter.string(from: currentDate)
    }
    
    
    func configureUI() {
        
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Participant information"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.HeavyGreen
        
        let navigationFont = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationFont]
    }
    
    
    func configureConstraints() {
        
        let firstNameStackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextfield])
        firstNameStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        firstNameStackView.axis = .vertical
        
        let lastNameStackView = UIStackView(arrangedSubviews: [lastNameLabel, lastNameTextfield])
        lastNameStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        lastNameStackView.axis = .vertical
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextfield])
        emailStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        emailStackView.axis = .vertical
        
        let phoneNumberStackView = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextfield])
        phoneNumberStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        phoneNumberStackView.axis = .vertical
        
        let dateStackView = UIStackView(arrangedSubviews: [dateLabel, dateTextfield])
        dateStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        dateStackView.axis = .vertical
        
        let countryStackView = UIStackView(arrangedSubviews: [countryLabel, countryTextfield])
        countryStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        countryStackView.axis = .vertical
        
        let groupCountStackView = UIStackView(arrangedSubviews: [groupCountLabel, groupCountTextfield])
        groupCountStackView.configureStackView(alignment: .center, distribution: .fillProportionally, spacing: nil)
        groupCountStackView.axis = .vertical
        
        let leftStackView = UIStackView(arrangedSubviews: [firstNameStackView, phoneNumberStackView, dateStackView])
        leftStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        leftStackView.axis = .vertical
        
        let rightStackView = UIStackView(arrangedSubviews: [lastNameStackView, emailStackView])
        rightStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        rightStackView.axis = .vertical
        
        let bottomRightStackView = UIStackView(arrangedSubviews: [countryStackView, groupCountStackView])
        bottomRightStackView.configureStackView(alignment: .center, distribution: .equalSpacing, spacing: 25)
        bottomRightStackView.axis = .horizontal
        
        //anchors
        view.addSubview(leftStackView)
        leftStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 80, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(rightStackView)
        rightStackView.anchor(top: view.topAnchor, left: leftStackView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 80, width: 0, height: 0)
        
        view.addSubview(bottomRightStackView)
        bottomRightStackView.anchor(top: rightStackView.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 80, width: 0, height: 0)
    }
}

extension ParticipantInfoVC: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(groupCounter[row])
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return groupCounter.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedGroupCount = String(groupCounter[row])
    }
    
}
