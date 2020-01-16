//
//  ReservationCell.swift
//  Jamwest Reservation
//
//  Created by Shannon Robinson on 1/15/20.
//  Copyright © 2020 Shannon Robinson. All rights reserved.
//

import UIKit

class ReservationCell: UICollectionViewCell {
    
//    MARK: - Labels
    
    let groupLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Group :"
        label.textColor = .darkText
        label.font = UIFont(name: avenirNext_Medium, size: 16)
        return label
    }()
    
    let hotelLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Hotel :"
        label.textColor = .darkText
        label.font = UIFont(name: avenirNext_Medium, size: 16)
        return label
    }()
    
    let timeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Time :"
        label.textColor = .darkText
        label.font = UIFont(name: avenirNext_Medium, size: 16)
        return label
    }()
    
    let toursLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Tours :"
        label.textColor = .darkText
        label.font = UIFont(name: avenirNext_Medium, size: 16)
        return label
    }()
    
    let pendingWaiversLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Pending waivers :"
        label.textColor = .darkText
        label.font = UIFont(name: avenirNext_Medium, size: 16)
        return label
    }()
    
    let groupNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Name of group"
        label.textColor = Constants.Design.Color.Primary.MarkerColor
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let hotelNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Name of hotel"
        label.textColor = Constants.Design.Color.Primary.MarkerColor
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let reservationTimeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Time of reservation"
        label.textColor = Constants.Design.Color.Primary.MarkerColor
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let reservationToursLabel: UILabel = {
        
        let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 4
        label.text = """
                    ATV Tour
                    Driving Experience
                    HorseBack Riding
                    Safari Tour
                    """
        label.textColor = Constants.Design.Color.Primary.MarkerColor
        label.font = UIFont(name: avenirNext_Demibold, size: 18)
        return label
    }()
    
    let pendingWaiversCountLabel: UILabel = {
        
        let label = UILabel()
        label.text = "6"
        label.textColor = Constants.Design.Color.Primary.Orange
        label.font = UIFont(name: avenirNext_Demibold, size: 26)
        return label
    }()
    
//    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    MARK: - Configure Cell Constraints
    
    func configureCell() {
        
        // stackViews on the left
        let groupInfoStackView = UIStackView(arrangedSubviews: [groupLabel, groupNameLabel])
        groupInfoStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        groupInfoStackView.axis = .vertical
        
        let hotelInfoStackView = UIStackView(arrangedSubviews: [hotelLabel, hotelNameLabel])
        hotelInfoStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        hotelInfoStackView.axis = .vertical
        
        let reservationTimeStackView = UIStackView(arrangedSubviews: [timeLabel, reservationTimeLabel])
        reservationTimeStackView.configureStackView(alignment: .leading, distribution: .fillProportionally, spacing: nil)
        reservationTimeStackView.axis = .vertical
        
        let leftStackView = UIStackView(arrangedSubviews: [groupInfoStackView, hotelInfoStackView, reservationTimeStackView])
        leftStackView.configureStackView(alignment: .leading, distribution: .fillEqually, spacing: 5)
        leftStackView.axis = .vertical
        
        // stackViews on the right
        let toursInfoStackView = UIStackView(arrangedSubviews: [toursLabel, reservationToursLabel])
        toursInfoStackView.configureStackView(alignment: .center, distribution: .equalCentering, spacing: nil)
        toursInfoStackView.axis = .vertical
        
        let pendingWaiverStackView = UIStackView(arrangedSubviews: [pendingWaiversLabel, pendingWaiversCountLabel])
        pendingWaiverStackView.configureStackView(alignment: .center, distribution: .fillEqually, spacing: nil)
        pendingWaiverStackView.axis = .vertical
        
        let rightStackView = UIStackView(arrangedSubviews: [toursInfoStackView, pendingWaiverStackView])
        rightStackView.configureStackView(alignment: .center, distribution: .fillProportionally, spacing: 5)
        rightStackView.axis = .vertical
        
        // set stackViews constraints
        addSubview(leftStackView)
        leftStackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(rightStackView)
        rightStackView.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
    }
}
