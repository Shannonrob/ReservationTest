//
//  LoginVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/8/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var window: UIWindow?
    
   let emailTextField: UITextField = {
      
       let textfield = UITextField()
    textfield.design(placeHolder: "Email", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 0, height: 0)
       textfield.addTarget(self, action: #selector(formValidation), for: .editingChanged)
       return textfield
   }()
    
    let passwordTextField: UITextField = {
       
        let textfield = UITextField()
        textfield.design(placeHolder: "Password", backgroundColor: .white, fontSize: 18, textColor: .black, borderStyle: .roundedRect, width: 0, height: 0)
        textfield.isSecureTextEntry = true
        textfield.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 374/255, green: 175/255, blue: 22/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    let incorrectPasswordLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Incorrect email or password"
        label.textColor = UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)
        label.isHidden = true
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 22)
        return label
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Dont have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)]))
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
//    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
        
        navigationController?.navigationBar.isHidden = true
        configureViewComponents()
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 50)
    }
   
    @objc func handleShowSignUp() {
        let signUpVC = SignUpVC()
        clearTextFields()
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
//            handle error
            if let error = error {
                print("Unable to sign user in with error", error.localizedDescription)
                self.incorrectPasswordLabel.isHidden = false
                return
            }
            
//            handle success
             
            
            self.clearTextFields()
        } 
    }
    
    @objc func formValidation() {
           guard
           emailTextField.hasText,
           passwordTextField.hasText else {
           loginButton.isEnabled = false
           incorrectPasswordLabel.isHidden = true
           loginButton.backgroundColor = UIColor(red: 374/255, green: 175/255, blue: 22/255, alpha: 1)
           return
           }
           loginButton.isEnabled = true
           loginButton.backgroundColor = UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)
       }
    
    func clearTextFields() {
        
        emailTextField.text = nil
        passwordTextField.text = nil
        formValidation()
    }
    
    func configureViewComponents() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton])
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 180, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 600, height: 180)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(incorrectPasswordLabel)
        incorrectPasswordLabel.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        incorrectPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
