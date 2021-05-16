//
//  TeamDetailsViewController.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var stadiumImg: UIImageView!
    @IBOutlet weak var stadiumNameLbl: UILabel!
    @IBOutlet weak var teamDetailsLbl: UILabel!
    @IBOutlet weak var stadiumDetailsLbl: UILabel!
    
    var selectedTeam: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teamNameLbl?.text = selectedTeam?.strTeam
        self.stadiumNameLbl?.text = selectedTeam?.strStadium
        self.teamDetailsLbl?.text = selectedTeam?.strDescriptionEN
        self.stadiumDetailsLbl?.text = selectedTeam?.strStadiumDescription
        self.teamImg?.sd_setImage(with: URL(string: selectedTeam?.strTeamBadge ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.stadiumImg?.sd_setImage(with: URL(string: selectedTeam?.strStadiumThumb ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
