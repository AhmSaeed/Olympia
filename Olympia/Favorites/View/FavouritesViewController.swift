//
//  FavoritesViewController.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavouriteOperationsDelegate {
    var tapGestureRecognizer :UITapGestureRecognizer?
    @IBOutlet weak var favouritesTableView: UITableView!
    
    var leagues: [NSManagedObject]?
    private var selectedRow: Int!
    private var selectedLeague: League!
    
    lazy var favouritesPresenter = FavouritesPresenterImpl(favouritesRepo: FavouritesRepoImpl(localDataSource: LocalDataSourceImpl()), favouritesViewController: self)
    
    func displayLeagues(LeaguesArray array: [NSManagedObject]) {
        leagues = array
        favouritesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favouritesPresenter.getFavouriteLeagues()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
    }
    
    func addFavouriteLeague() {
        favouritesPresenter.addFavouriteLeague(league: selectedLeague)
        favouritesPresenter.getFavouriteLeagues()
    }
    
    func removeFavouriteLeague() {
        guard let leagueManagedObject = leagues?[selectedRow] else { return }
        let league = Mapper.nsManagedObjectToLeague(league: leagueManagedObject)
        favouritesPresenter.removeFavouriteLeague(league: league)
        favouritesPresenter.getFavouriteLeagues()
    }
    
    // MARK: - Table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = leagues?.count
            else{
                return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("LeagueCell", owner: self, options: nil)?.first as! LeagueTableViewCell
        if let leagueManagedObject = leagues?[indexPath.row] {
            print(leagueManagedObject)
            cell.league = Mapper.nsManagedObjectToLeague(league: leagueManagedObject)
            NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name("displayNoLink"), object: nil)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        if let leagueManagedObject = leagues?[indexPath.row] {
            selectedLeague = Mapper.nsManagedObjectToLeague(league: leagueManagedObject)
        }
        
        guard let leaguesDetailsViewController = self.storyboard?.instantiateViewController(identifier: "LeagueDetailsViewController") else {return}
        (leaguesDetailsViewController as! LeagueDetailsViewController).favouriteOperationsDelegate = self
        (leaguesDetailsViewController as! LeagueDetailsViewController).selectedLeague = selectedLeague
        self.navigationController?.present(leaguesDetailsViewController as! LeagueDetailsViewController, animated: true, completion: nil)
    }
    
    @objc func showAlert(Message message : String, Details details : String){
        let alert = UIAlertController(title: message, message: details, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 20
        
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 30    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 20, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available Leagues"
    }
    
    @objc func displayNoLink (notification: Notification){
        let leag = notification.object as! League
        showAlert(Message: "Sorry",Details: "No link Available for \(leag.strLeague!) League")
    }
    
}


