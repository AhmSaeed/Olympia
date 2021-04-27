//
//  SportsViewController.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import SDWebImage
//private let reuseIdentifier = "Cell"

class SportsViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{

    var sports: [Sport] = []
    let sportPresenter = SportsRepoImpl(remoteDataSource: RemoteDataSourceImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        sportPresenter.getSports { result, error in
            self.sports = result?.sports ?? []
                  self.collectionView.reloadData()
        }
      
            
       
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if(segue.identifier == "leagueDetails"){
//            let viewsport = segue.destination as! LeaguesViewController
//         //   viewsport =mysport[collectionView.indexPathsForSelectedItems[].row].strSport
//        }
//    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath)as! SportCollectionViewCell
        
        cell.sport = sports[indexPath.row]
        
        // Configure the cell
    
        return cell
    }
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width / 2) - 25
        let height = width * 1.45
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
    }

}
