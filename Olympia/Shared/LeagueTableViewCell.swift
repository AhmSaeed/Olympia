//
//  MyCell.swift
//  Olympia
//
//  Created by Doaa on 4/19/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import SDWebImage

class LeagueTableViewCell: UITableViewCell {
    @IBOutlet weak private var _strBadgeImg: UIImageView!
    @IBOutlet weak private var _strLeagueLbl: UILabel!
    @IBOutlet weak private var _strYoutubeBtn: UIButton!
    
    var league : League? {
        didSet {
            _strBadgeImg?.sd_setImage(with: URL(string: league?.strBadge ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            _strLeagueLbl.text = league?.strLeague
        }
    }
    
    
    @IBAction func onVideoIconClick(_ sender: Any) {
        if (!(league?.strYoutube!)!.isEmpty) {
        let appURL = URL(string: "https://\((league?.strYoutube)!)")!
        let webURL = URL(string: "https://\((league?.strYoutube)!)")!
            let application = UIApplication.shared
            print(webURL.absoluteString)
            if application.canOpenURL(appURL) {
                application.open(appURL)
            } else {
                // if Youtube app is not installed, open URL inside Safari
                application.open(webURL)
            }
        }
        else{
            NotificationCenter.default.post(name: NSNotification.Name("displayNoLink"), object: league)
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self._strBadgeImg.layer.cornerRadius = _strBadgeImg.frame.size.width/2
        self._strBadgeImg.clipsToBounds = true
        self._strYoutubeBtn.clipsToBounds = true
    }

}
