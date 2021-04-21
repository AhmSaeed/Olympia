//
//  LeagueDetailsViewController.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UITableViewController {
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leagueDetailsTableView.dataSource = self
    }
    
}

extension LeagueDetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 190
        } else if indexPath.row == 1 {
            let side = (tableView.frame.width - 65) / 2
            return calcColectionViewHeight(noOfItems: 20, noOfRow: 2, cellHeight: side, viewTopOffset: 50, viewBottomOffset: 20, lineSpacing: 20)
        } else {
            return 120
        }
    }
    
    func calcColectionViewHeight(noOfItems: CGFloat, noOfRow: CGFloat, cellHeight: CGFloat, viewTopOffset: CGFloat, viewBottomOffset: CGFloat, lineSpacing: CGFloat) -> CGFloat {

        let totalRow = ceil(noOfItems / noOfRow)
        let totalTopBottomOffset = viewTopOffset + viewBottomOffset
        let totalSpacing = CGFloat(totalRow - 1) * lineSpacing   // total line space in UICollectionView is (totalRow - 1)
        let totalHeight  = (cellHeight * totalRow) + totalTopBottomOffset + totalSpacing

        return totalHeight
    }
}
