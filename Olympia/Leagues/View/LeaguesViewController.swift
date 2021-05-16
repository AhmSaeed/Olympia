//
//  AllLeaguesViewController.swift
//  Olympia
//
//  Created by Doaa on 4/21/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import SDWebImage

class LeaguesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavouriteOperationsDelegate {
    var tapGestureRecognizer :UITapGestureRecognizer?
    @IBOutlet weak var leaguesTableView: UITableView!
    var sportName: String?
    var isFavouriteTab : Bool?
    var leagues: [League]?
    
    lazy var leaguePresenter = LeaguesPresenterImpl(leaguesRepo: LeaguesRepoImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl()), leaguesViewController: self)
    
    func displayLeagues(LeaguesArray array: [League]) {
        leagues?.removeAll()
        leagues = array
        leaguesTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let sportName = sportName {
            leaguePresenter.getLeagues(by: sportName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
    }
    
    func addFavouriteLeague() {
        guard let selectedRow = leaguesTableView.indexPathForSelectedRow?.row else { return }
        guard let league = leagues?[selectedRow] else { return }
        leaguePresenter.addFavouriteLeague(league: league)
    }
    
    func removeFavouriteLeague() {
        guard let selectedRow = leaguesTableView.indexPathForSelectedRow?.row else { return }
        guard let league = leagues?[selectedRow] else { return }
        leaguePresenter.removeFavouriteLeague(league: league)
    }
    
    func showNoInternetAlert() {
        UIHelper.showAlert(at: self, message: "No internet connection!")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
        if (leagues?.count) != nil{
            cell.league = leagues?[indexPath.row]
            NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name("displayNoLink"), object: nil)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let leaguesDetailsViewController = self.storyboard?.instantiateViewController(identifier: "LeagueDetailsViewController") else {return}
        (leaguesDetailsViewController as! LeagueDetailsViewController).favouriteOperationsDelegate = self
        (leaguesDetailsViewController as! LeagueDetailsViewController).selectedLeague = leagues?[indexPath.row]
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

