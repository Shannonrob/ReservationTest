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
        label.textColor = Constants.Design.Color.Hue.Green
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let hotelNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Name of hotel"
        label.textColor = Constants.Design.Color.Hue.Green
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let reservationTimeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Time of reservation"
        label.textColor = Constants.Design.Color.Hue.Green
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let reservationToursLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Reservation tours"
        label.textColor = Constants.Design.Color.Hue.Green
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
        return label
    }()
    
    let pendingWaiversCountLabel: UILabel = {
        
        let label = UILabel()
        label.text = "6"
        label.textColor = Constants.Design.Color.Primary.Orange
        label.font = UIFont(name: avenirNext_Demibold, size: 24)
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
    
    
//    MARK: - Configure Cell
    
    func configureCell() {
        // properties on the left side of the cell
        addSubview(groupLabel)
        groupLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(groupNameLabel)
        groupNameLabel.anchor(top: groupLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(hotelLabel)
        hotelLabel.anchor(top: groupNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
               
        addSubview(hotelNameLabel)
           hotelNameLabel.anchor(top: hotelLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(timeLabel)
        timeLabel.anchor(top: hotelNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
               
        addSubview(reservationTimeLabel)
           reservationTimeLabel.anchor(top: timeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // properties on the right side of the cell
        addSubview(toursLabel)
        toursLabel.anchor(top: topAnchor, left: groupLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: (frame.width/2) + 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(reservationToursLabel)
        reservationToursLabel.anchor(top: toursLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 25, paddingRight: frame.width / 10, width: 0, height: 0)
        
        addSubview(pendingWaiversCountLabel)
        pendingWaiversCountLabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: frame.width / 4, width: 0, height: 0)
        
        addSubview(pendingWaiversLabel)
        pendingWaiversLabel.anchor(top: nil, left: timeLabel.rightAnchor, bottom: pendingWaiversCountLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: (frame.width/2) + 8, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
    }
}
