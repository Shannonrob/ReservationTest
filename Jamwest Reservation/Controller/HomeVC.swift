//
//  HomeVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class HomeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
 //    MARK: - Properties
    var delegate: HomeVcDelegate?
    var currentDate = String()
//    var toursDictionary = [:] as [String: Any] delete if not used
    var reservations = [Reservation]()
    
    
    
 //    MARK: - Init
     
     override func viewDidLoad() {
         super.viewDidLoad()
        
        // register cell classes
        self.collectionView!.register(ReservationCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        configureUI()
        fetchPosts()
     }
     
 //    MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
//    MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // cell sizes
        let width = (view.frame.width - 26) / 2
        return CGSize(width: width, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 8, bottom: 5, right: 8)
    }
    
    
//    MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reservations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReservationCell
        
        cell.reservation = reservations[indexPath.item]
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        
        // cell shadow
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        return cell
    }
    
//    MARK: - Helper functions
    
    func configureUI() {
        
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        collectionView.backgroundColor = Constants.Design.Color.Background.FadeGray
       
        let reservation = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.HeavyGreen
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Reservation"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: reservation]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func formatReservationDate() {
       
       // gets the current date
       let date: Date = Date()
       let reservationDateFormatter = DateFormatter()
       reservationDateFormatter.dateStyle = .medium

       currentDate = reservationDateFormatter.string(from: date)
   }

//    MARK: - API
    
    func fetchPosts() {
    
        formatReservationDate()
        
        RESERVATION_DATE_REF.child(currentDate).observe(.childAdded) { (snapshot) in
            
            let reservationIds = snapshot.key
            
            RESERVATION_REF.child(reservationIds).observeSingleEvent(of: .value) { (reservationSnapshot) in
    
                guard let dictionary = reservationSnapshot.value as? Dictionary<String, AnyObject> else { return }
                
                let reservation = Reservation(reservationId: reservationIds, dictionary: dictionary)
                
                self.reservations.append(reservation)
                
//                self.reservations.sort { (resertvation1, reservation2) -> Bool in
//                    return resertvation1.group > reservation2.group
//                }
                
                self.collectionView.reloadData()
            }
        }
    }
 }
