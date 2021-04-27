//
//  TeamCollectionViewCell.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/21/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var _strTeamBadgeImg: UIImageView!
    
    var team: Team? {
        didSet {
            _strTeamBadgeImg?.sd_setImage(with: URL(string: team?.strTeamBadge ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    let CORNER_RADIUS: CGFloat = 25
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CORNER_RADIUS
        self.layer.masksToBounds = false
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CORNER_RADIUS)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.orange.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 1)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowPath = shadowPath.cgPath
    }
}
