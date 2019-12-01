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
    
//    MARK: - Labels
    
    let greetingLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.text = """
        Welcome to Jamwest
             Adventure Park
        """
        label.font = UIFont(name: avenirNext_Demibold, size: 30)
        return label
    }()
     
    let selectGroupLabel: UILabel = {

        let label = UILabel()
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.text = """
        Select group to
        sign your waiver.
        """
        label.font = UIFont(name: avenirNext_Demibold, size: 40)
        return label
    
    }()
//    MARK: - UIViews
    
    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Design.Color.Primary.Purple
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
 //    MARK: - Init
     
     override func viewDidLoad() {
         super.viewDidLoad()
        
        configureViewConstraints()
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        
        configureNavigationBar()
     }
     
 //    MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
//        NavigationBar title size
        
        let reservation = UIFont.boldSystemFont(ofSize: 25)
//        let reservation = UIFont.init(name:"Helvetica neue", size: 25)!
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.Purple
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Reservation"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: reservation]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
//    MARK: - Contraints
    func configureViewConstraints() {
    
//      UIViews
        
        view.addSubview(rightView)
        rightView.anchor(top: view.topAnchor, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width / 2, height: 0)
        
//        view.addSubview(bottomView)
//        bottomView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 75)
    
//    UILabels
        
        let greetingLabelsStackView = UIStackView(arrangedSubviews: [greetingLabel, selectGroupLabel])
        greetingLabelsStackView.axis = .vertical
        greetingLabelsStackView.configureStackView(alignment: .center, distribution: .equalSpacing, spacing: 60)
        
        rightView.addSubview(greetingLabelsStackView)
        greetingLabelsStackView.anchor(top: rightView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 120, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        greetingLabelsStackView.centerXAnchor.constraint(equalTo: rightView.centerXAnchor).isActive = true
    
    }
     
 }
