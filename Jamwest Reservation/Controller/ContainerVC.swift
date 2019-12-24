//
//  ContainerVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit
import Firebase

class ContainerVC: UIViewController {
 
//    MARK: - Properties

    var menuVC: MenuVC!
    var centerController: UIViewController!
    var isExpanded = false

//    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser == nil {
            presentLogInVC()
        } else {
            presentHomeVC()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return.slide
    }
    
    override var prefersStatusBarHidden: Bool{
        return  isExpanded
    }
    
//    MARK: - Handlers
    
    func presentHomeVC() {
        let homeVC = HomeVC()
        homeVC.delegate = self
        centerController = UINavigationController(rootViewController: homeVC)

        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func presentLogInVC() {
        let loginVC = LoginVC()
        centerController = UINavigationController(rootViewController: loginVC)

        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuVC() {
        if menuVC == nil {
//            add menu controller here
            menuVC = MenuVC()
            menuVC.delegate = self
            view.insertSubview(menuVC.view, at: 0)
            addChild(menuVC)
            menuVC.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool,menuOption: MenuOption?) {
        
        if shouldExpand {
//         show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 780
            }, completion: nil)
        } else {
//            hide menu
                      
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption{
        case .Submit:
            print("Submit email")
        case .Waivers:
            let waiverVC = WaiverVC()
            let navigationController = UINavigationController(rootViewController: waiverVC)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        case .Reservations:
            let addReservationVC = AddReservationVC()
            present(UINavigationController(rootViewController: addReservationVC), animated: true, completion: nil)
        case .LogOut:
            do
            {
                 try Auth.auth().signOut()
               presentLogInVC()
            }
            catch let error as NSError
            {
                print (error.localizedDescription)
            }

        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
      }, completion: nil)
    }
}

extension ContainerVC: HomeVcDelegate {
   
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
        configureMenuVC()
    }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}

