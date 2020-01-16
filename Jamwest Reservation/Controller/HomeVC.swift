//
//  HomeVC.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 11/3/19.
//  Copyright © 2019 Shannon Robinson. All rights reserved.
//

 import UIKit

private let reuseIdentifier = "Cell"

class HomeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
 //    MARK: - Properties
    var delegate: HomeVcDelegate?
    
 //    MARK: - Init
     
     override func viewDidLoad() {
         super.viewDidLoad()
        
        // register cell classes
        self.collectionView!.register(ReservationCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        configureUI()
     }
     
 //    MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
//    MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // cell sizes
        let width = (view.frame.width - 5) / 2
        return CGSize(width: width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
//    MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReservationCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func configureUI() {
        
        view.backgroundColor = Constants.Design.Color.Background.FadeGray
        collectionView.backgroundColor = Constants.Design.Color.Hue.Green
        
        let reservation = UIFont.boldSystemFont(ofSize: 25)
        navigationController?.navigationBar.barTintColor = Constants.Design.Color.Primary.HeavyGreen
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Reservation"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: reservation]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
 }
