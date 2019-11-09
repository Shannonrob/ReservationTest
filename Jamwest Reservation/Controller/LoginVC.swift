//
//  LoginVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/8/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
   let emailTextField: UITextField = {
      
       let textfield = UITextField()
       textfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
       textfield.backgroundColor = UIColor.white
       textfield.borderStyle = .roundedRect
       textfield.font = UIFont.systemFont(ofSize: 18)
       textfield.textColor = .black
       return textfield
   }()
    
    let passwordTextField: UITextField = {
       
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textfield.backgroundColor = UIColor.white
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.textColor = .black
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Dont have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
        
        configureViewComponents()
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 50)
    }
   
    func configureViewComponents() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton])
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 200, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 600, height: 180)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
