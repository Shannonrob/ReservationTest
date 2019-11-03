//
//  HomeVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

 import UIKit

 class HomeVC: UIViewController {
  
 //    MARK: - Properties
    
    var delegate: HomeVcDelegate?
     
 //    MARK: - Init
     
     override func viewDidLoad() {
         super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
     }
     
 //    MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 17/255, green: 16/255, blue: 38/255, alpha: 95)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Reservation"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
     
     
 }
