//
//  LatestResultCollectionViewCell.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/20/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import SDWebImage

class LatestResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var _strThumbImg: UIImageView!
    @IBOutlet weak private var _dateTimeLbl: UILabel!
    @IBOutlet weak private var _strHomeTeamLbl: UILabel!
    @IBOutlet weak private var _intHomeScoreLbl: UILabel!
    @IBOutlet weak private var _strAwayTeamLbl: UILabel!
    @IBOutlet weak private var _intAwayScoreLbl: UILabel!
    
    
    var sportEvent: SportEvent? {
        didSet {
            _strThumbImg?.sd_setImage(with: URL(string: sportEvent?.strThumb ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            _dateTimeLbl.text = DateFormatter.getdMMMhhmma(timeStamp: sportEvent?.strTimestamp ?? "")
            _strHomeTeamLbl.text = sportEvent?.strHomeTeam
            _intHomeScoreLbl.text = sportEvent?.intHomeScore
            _strAwayTeamLbl.text = sportEvent?.strAwayTeam
            _intAwayScoreLbl.text = sportEvent?.intAwayScore
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
