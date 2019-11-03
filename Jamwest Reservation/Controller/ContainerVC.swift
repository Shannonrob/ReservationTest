//
//  ContainerVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
 
//    MARK: - Properties
    
    var menuVC: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false

//    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeVC()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
//    MARK: - Handlers
    
    func configureHomeVC() {
        let homeVC = HomeVC()
        homeVC.delegate = self
        centerController = UINavigationController(rootViewController: homeVC)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuVC() {
        if menuVC == nil {
//            add menu controller here
            menuVC = MenuVC()
            view.insertSubview(menuVC.view, at: 0)
            addChild(menuVC)
            menuVC.didMove(toParent: self)
        }
    }
    
    func showMenuVC(shouldExpand: Bool) {
        
        if shouldExpand {
//         show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 780
            }, completion: nil)
        } else {
//            hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
               self.centerController.view.frame.origin.x = 0
           }, completion: nil)
        }
    }
}

extension ContainerVC: HomeVcDelegate {
    
    func handleMenuToggle() {
       
        if !isExpanded {
            configureMenuVC()
        }
        
        isExpanded = !isExpanded
        showMenuVC(shouldExpand: isExpanded)
    }
    
    
}
