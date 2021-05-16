//
//  SportCollectionViewCell.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import SDWebImage

protocol SportCollectionViewCellDelegate: AnyObject {
    func didTapLeagueBtn(with sport: Sport)
}

class SportCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var _strSportLbl: UILabel!
    @IBOutlet weak private var _strSportThumbImg: UIImageView!
    
    weak var delegate: SportCollectionViewCellDelegate?
    
    
    var sport: Sport? {
        didSet {
            _strSportThumbImg?.sd_setImage(with: URL(string: sport?.strSportThumb ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            _strSportLbl.text = sport?.strSport
        }
    }
    
    @IBAction func onLeagueBtnClick(_ sender: UIButton) {
        guard let sport = sport else {return}
        delegate?.didTapLeagueBtn(with: sport)
    }
    
    
}
