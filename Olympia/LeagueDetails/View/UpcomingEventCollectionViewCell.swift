//
//  UpcomingLeagueCollectionViewCell.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/19/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

class UpcomingEventCollectionViewCell: UICollectionViewCell {

    let CORNER_RADIUS: CGFloat = 30
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CORNER_RADIUS
        self.contentView.layer.cornerRadius = CORNER_RADIUS
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CORNER_RADIUS)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 1)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowPath = shadowPath.cgPath
    }
}
