//
//  ToursSelectionVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/29/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class ToursSelectionVC: UIViewController{
    

//    MARK: - Properties
    
    var comboDealToursArray = [UIButton]()
    
//    MARK: - Labels
    
    let tourLabel: UILabel = {

        let label = UILabel()
        label.text = "Please select reserved tours"
        label.textColor = .darkText
        label.font = UIFont(name: avenirNext_Regular, size: 32)
        return label
    }()
    
    
//    MARK: - Buttons
    
   let atvTourButton: UIButton = {

   
    let button = UIButton(type: .system)
   
       button.setButtonIcon("orangeATV", title: "ATV Tour", titleColor: .gray, buttonColor: .white, cornerRadius: 6)
       button.titleLabel?.font = .systemFont(ofSize: 24)
       button.layer.borderWidth = 0.80
       button.layer.borderColor = UIColor.lightGray.cgColor
       button.addTarget(self, action: #selector(handleATVTour), for: .touchUpInside)
       return button
    
   }()
   
   let horseBackRidingTourButton: UIButton = {
    
       let button = UIButton(type: .system)
       button.setButtonIcon("orangeHorseRiding", title: "Horseback", titleColor: .gray, buttonColor: .white, cornerRadius: 6)
       button.titleLabel?.font = .systemFont(ofSize: 24)
       button.layer.borderWidth = 0.80
       button.layer.borderColor = UIColor.lightGray.cgColor
       button.addTarget(self, action: #selector(handleHorseBackRidingTour), for: .touchUpInside)
       return button
   }()
   
   let safariTourButton: UIButton = {
    
       let button = UIButton(type: .system)
       button.setButtonIcon("orangeCrocodile", title: "Safari Tour", titleColor: .gray, buttonColor: .white, cornerRadius: 6)
       button.titleLabel?.font = .systemFont(ofSize: 24)
       button.layer.borderWidth = 0.80
       button.layer.borderColor = UIColor.lightGray.cgColor
       button.addTarget(self, action: #selector(handleSafariTour), for: .touchUpInside)
       return button
   }()
   
   let zipLineTourButton: UIButton = {
    
       let button = UIButton(type: .system)
       button.setButtonIcon("orangeZipline", title: "Zip Line", titleColor: .gray, buttonColor: .white, cornerRadius: 6)
       button.titleLabel?.font = .systemFont(ofSize: 24)
       button.layer.borderWidth = 0.80
       button.layer.borderColor = UIColor.lightGray.cgColor
       button.addTarget(self, action: #selector(handleZiplineTour), for: .touchUpInside)
       return button
   }()
   
   let pushKartTourButton: UIButton = {
    
       let button = UIButton(type: .system)
       button.setButtonIcon("orangeKart", title: "Push Kart", titleColor: .gray, buttonColor: .white, cornerRadius: 6)
       button.titleLabel?.font = .systemFont(ofSize: 24)
       button.layer.borderWidth = 0.80
       button.layer.borderColor = UIColor.lightGray.cgColor
       button.addTarget(self, action: #selector(handlePushKartTour), for: .touchUpInside)
       return button
   }()
    
    let submitButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.red, for: .selected)
        button.backgroundColor = Constants.Design.Color.FadedHue.Green
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSubmitButton), for: .touchUpInside)
           return button
       }()
   
    
    
//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

       configureUI()
       updateTourLabel()
       setConstraints()
    }
    
//    MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleATVTour() {
    
        updateSelectionFont(button: atvTourButton)
        
        switch tour_Package_Selected {
            
        case single_Tour:
            horseBackRidingTourButton.isSelected = false
            horseBackRidingTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            pushKartTourButton.isSelected = false
            pushKartTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            safariTourButton.isSelected = false
            safariTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            zipLineTourButton.isSelected = false
            zipLineTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            single_Tour_Selected = atvTourButton.currentTitle!
            updateSingleTourSubmitButtonStyle()
        
        case combo_Deal:
            updateComboDealArray(button: atvTourButton)
            updateComboDealSubmitButtonStyle()
            
        case super_Deal:
            print("Super")
            
        default:
            return
        }
    }
    
    @objc func handleHorseBackRidingTour() {
        
        updateSelectionFont(button: horseBackRidingTourButton)
    
        switch tour_Package_Selected {
            
        case single_Tour:
            atvTourButton.isSelected = false
            atvTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            pushKartTourButton.isSelected = false
            pushKartTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            safariTourButton.isSelected = false
            safariTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            zipLineTourButton.isSelected = false
            zipLineTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            single_Tour_Selected = horseBackRidingTourButton.currentTitle!
            updateSingleTourSubmitButtonStyle()
            
        case combo_Deal:
            
            updateComboDealArray(button: horseBackRidingTourButton)
            updateComboDealSubmitButtonStyle()
            
        case super_Deal:
            print("Super")
            
        default:
            return
        }
    }
    
    @objc func handlePushKartTour() {
    
        updateSelectionFont(button: pushKartTourButton)
        
        switch tour_Package_Selected {
            
        case single_Tour:
            atvTourButton.isSelected = false
            atvTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            horseBackRidingTourButton.isSelected = false
            horseBackRidingTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            safariTourButton.isSelected = false
            safariTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            zipLineTourButton.isSelected = false
            zipLineTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            single_Tour_Selected = pushKartTourButton.currentTitle!
            updateSingleTourSubmitButtonStyle()
            
        case combo_Deal:
            
            updateComboDealArray(button: pushKartTourButton)
            updateComboDealSubmitButtonStyle()
            
        case super_Deal:
            print("Super")
            
        default:
            return
        }
    }
    
    @objc func handleSafariTour() {
    
        updateSelectionFont(button: safariTourButton)
        
        switch tour_Package_Selected {
            
        case single_Tour:
            atvTourButton.isSelected = false
            atvTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            horseBackRidingTourButton.isSelected = false
            horseBackRidingTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            pushKartTourButton.isSelected = false
            pushKartTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            zipLineTourButton.isSelected = false
            zipLineTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            single_Tour_Selected = safariTourButton.currentTitle!
            updateSingleTourSubmitButtonStyle()
        
        case combo_Deal:
            
            updateComboDealArray(button: safariTourButton)
            updateComboDealSubmitButtonStyle()
            
        case super_Deal:
            print("Super")
            
        default:
            return
        }
    }
    
    @objc func handleZiplineTour() {
    
        updateSelectionFont(button: zipLineTourButton)
        
        switch tour_Package_Selected {
            
        case single_Tour:
            atvTourButton.isSelected = false
            atvTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            horseBackRidingTourButton.isSelected = false
            horseBackRidingTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            pushKartTourButton.isSelected = false
            pushKartTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            safariTourButton.isSelected = false
            safariTourButton.titleLabel?.font = .systemFont(ofSize: 24)
            single_Tour_Selected = zipLineTourButton.currentTitle!
            updateSingleTourSubmitButtonStyle()
            
        case combo_Deal:
            
            updateComboDealArray(button: zipLineTourButton)
            updateComboDealSubmitButtonStyle()
            
        case super_Deal:
            print("Super")
            
        default:
            return
        }
    }
    
    @objc func handleSubmitButton() {
        
        switch tour_Package_Selected {
        case single_Tour:
            print(single_Tour_Selected)
        case combo_Deal:
            
            for element in comboDealToursArray {
                print(element.currentTitle!)
            }
            
        case super_Deal:
            break
        default:
            return
            
        }
    }
    
//    MARK: - Helper Functions

    func updateTourLabel() {
        if tour_Package_Selected == single_Tour {
            tourLabel.text = "Please select reserved tour"
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.Purple
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Tour selection"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        
        let reservation = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: reservation]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "whiteBack ").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
    
    func setConstraints() {
    
        view.addSubview(tourLabel)
        tourLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        tourLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [atvTourButton, horseBackRidingTourButton, pushKartTourButton, safariTourButton, zipLineTourButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: tourLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 20, paddingBottom:0, paddingRight: 15, width: 0, height: 300)
        
        view.addSubview(submitButton)
        submitButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 50, paddingRight: 15, width: 0, height: 60)
    }
    
//    Function to update font style on button selection
    func updateSelectionFont(button: UIButton) {
       
        if !button.isSelected == true {
            button.isSelected = true
            button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        } else {
            button.isSelected = false
            button.titleLabel?.font = .systemFont(ofSize: 24)
        }
    }
    
//    Function to add or removew from ComboDeal Array
    func updateComboDealArray(button: UIButton) {
        
        if !comboDealToursArray.contains(button) {
            comboDealToursArray.append(button)
            button.isSelected = true
        } else {
            comboDealToursArray.remove(object: button)
            button.isSelected = false
            button.titleLabel?.font = .systemFont(ofSize: 24)
        }
    }
    
    func activateSubmitButton() {
        submitButton.isEnabled = true
        submitButton.backgroundColor = Constants.Design.Color.Hue.Green
    }

    func updateSingleTourSubmitButtonStyle() {
        
        activateSubmitButton()
        guard atvTourButton.isSelected || horseBackRidingTourButton.isSelected || pushKartTourButton.isSelected || safariTourButton.isSelected || zipLineTourButton.isSelected == true else {
        submitButton.backgroundColor = Constants.Design.Color.FadedHue.Green
        submitButton.isEnabled = false
        return
        }
    }
    
    func updateComboDealSubmitButtonStyle() {
        
        activateSubmitButton()
        guard comboDealToursArray.count >= 2 else {
        submitButton.backgroundColor = Constants.Design.Color.FadedHue.Green
        submitButton.isEnabled = false
        return
        }
    }
}
