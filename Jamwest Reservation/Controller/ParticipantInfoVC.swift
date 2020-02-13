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
        textfield.design(placeHolder: "Country", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 400, height: 51)
        textfield.setTextfieldIcon(#imageLiteral(resourceName: "orangeMap "))
        textfield.layer.borderWidth = 0.85
        textfield.layer.cornerRadius = 4
        textfield.layer.masksToBounds = true
        textfield.layer.borderColor = Constants.Design.Color.Border.Blue
        textfield.addTarget(self, action: #selector(handleFormValidation), for: .editingChanged)
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

    
//    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        
        firstNameTextfield.becomeFirstResponder()
        
        textFieldDelegates()
        getCurrentDate(textField: dateTextfield)
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
       
    }
    

//    MARK: - Handlers
    
    @objc func handleFormValidation() {
        
    }

    
//    MARK: - Helpers Functions
    
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
        navigationItem.title = "Participant waiver"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.HeavyGreen
        
        let navigationFont = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationFont]
    }
    
    
    func configureConstraints() {
        
        let firstNameStackVIew = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextfield])
        firstNameStackVIew.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        firstNameStackVIew.axis = .vertical
        
        let lastNameStackVIew = UIStackView(arrangedSubviews: [lastNameLabel, lastNameTextfield])
        lastNameStackVIew.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        lastNameStackVIew.axis = .vertical
        
        let emailStackVIew = UIStackView(arrangedSubviews: [emailLabel, emailTextfield])
        emailStackVIew.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        emailStackVIew.axis = .vertical
        
        let phoneNumberStackVIew = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextfield])
        phoneNumberStackVIew.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        phoneNumberStackVIew.axis = .vertical
        
        let countryStackVIew = UIStackView(arrangedSubviews: [countryLabel, countryTextfield])
        countryStackVIew.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        countryStackVIew.axis = .vertical
        
        let dateStackVIew = UIStackView(arrangedSubviews: [dateLabel, dateTextfield])
        dateStackVIew.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        dateStackVIew.axis = .vertical
        
        let leftStackView = UIStackView(arrangedSubviews: [firstNameStackVIew, phoneNumberStackVIew, countryStackVIew])
        leftStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        leftStackView.axis = .vertical
        
        let rightStackView = UIStackView(arrangedSubviews: [lastNameStackVIew, emailStackVIew, dateStackVIew])
        rightStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 25)
        rightStackView.axis = .vertical
        
        
        view.addSubview(leftStackView)
        leftStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 80, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(rightStackView)
        rightStackView.anchor(top: view.topAnchor, left: leftStackView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 80, width: 0, height: 0)
    }
    
}
