//
//  SignUpVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/9/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    let emailTextField: UITextField = {
         
          let textfield = UITextField()
          textfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
          textfield.backgroundColor = UIColor.white
          textfield.borderStyle = .roundedRect
          textfield.font = UIFont.systemFont(ofSize: 18)
          textfield.textColor = .black
          return textfield
      }()
    
    let userNameTextfield: UITextField = {
         
          let textfield = UITextField()
          textfield.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
          textfield.backgroundColor = UIColor.white
          textfield.borderStyle = .roundedRect
          textfield.font = UIFont.systemFont(ofSize: 18)
          textfield.textColor = .black
          return textfield
      }()
    
    let passwordTextfield: UITextField = {
         
          let textfield = UITextField()
          textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
          textfield.backgroundColor = UIColor.white
          textfield.borderStyle = .roundedRect
          textfield.font = UIFont.systemFont(ofSize: 18)
          textfield.textColor = .black
          return textfield
      }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let alreadyHaveAccount: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(red: 242/255, green: 125/255, blue: 15/255, alpha: 1)]))
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
        
        configureViewComponents()
        
        view.addSubview(alreadyHaveAccount)
        alreadyHaveAccount.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 50)
    }
    
    @objc func handleShowLogIn() {
        _ = navigationController?.popViewController(animated: true)
    }

    func configureViewComponents() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,userNameTextfield,passwordTextfield,signUpButton])
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 180, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 600, height: 240)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
   

}
