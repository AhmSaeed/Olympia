//
//  LeagueDetailsViewController.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LeagueDetailsViewController: UITableViewController {
    @IBOutlet private weak var leagueDetailsTableView: UITableView!
    @IBOutlet private weak var upcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var LatestResultsCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    let upcomingEventsSubject = PublishSubject<[SportEvent]>()
    private var upcomingEventsDriver: Driver<[SportEvent]>!
    let latestResultsSubject = PublishSubject<[SportEvent]>()
    private var latestResultsDriver: Driver<[SportEvent]>!
    let teamsSubject = PublishSubject<[Team]>()
    private var teamsDriver: Driver<[Team]>!
    
    lazy var leagueDetailsPresenter = LeagueDetailsPresenterImpl(leagueDetailsRepo: LeagueDetailsRepoImpl(remoteDataSource: RemoteDataSourceImpl()), leagueDetailsViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingEventsDriver = upcomingEventsSubject.asDriver(onErrorJustReturn: [])
        latestResultsDriver = latestResultsSubject.asDriver(onErrorJustReturn: [])
        teamsDriver = teamsSubject.asDriver(onErrorJustReturn: [])
        
        leagueDetailsTableView.dataSource = self
        
        setupUpcomingEventsCollectionView()
        
        setupLatestResultsCollectionView()
        
        setupTeamsColectionView()
        
        leagueDetailsPresenter.getUpcomingEvents()
        leagueDetailsPresenter.getLastResults()
        leagueDetailsPresenter.getTeamsByLeague()
    }
    
    func setupUpcomingEventsCollectionView() {
        self.upcomingEventsCollectionView.delegate = nil
        self.upcomingEventsCollectionView.dataSource = nil
        self.upcomingEventsCollectionView.allowsSelection = false
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 120, height: 120)
        flowLayout.scrollDirection = .horizontal
        
        self.upcomingEventsCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        upcomingEventsDriver.drive(upcomingEventsCollectionView.rx.items(cellIdentifier: "upcomingEventCell", cellType: UpcomingEventCollectionViewCell.self)){ row, item, cell in
            cell.sportEvent = item
        }.disposed(by: disposeBag)
    }
    
    func setupLatestResultsCollectionView() {
        self.LatestResultsCollectionView.delegate = nil
        self.LatestResultsCollectionView.dataSource = nil
        self.LatestResultsCollectionView.allowsSelection = false
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let side = (tableView.frame.width - 50) / 2
        
        flowLayout.itemSize = CGSize(width: side, height: side)
        
        self.LatestResultsCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        latestResultsDriver.drive(LatestResultsCollectionView.rx.items(cellIdentifier: "latestResultCell", cellType: LatestResultCollectionViewCell.self)){ row, item, cell in
            cell.sportEvent = item
        }.disposed(by: disposeBag)
    }
    
    func setupTeamsColectionView() {
        self.teamsCollectionView.delegate = nil
        self.teamsCollectionView.dataSource = nil
        self.teamsCollectionView.allowsSelection = false
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 50, height: 50)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 30
        
        self.teamsCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        teamsDriver.drive(teamsCollectionView.rx.items(cellIdentifier: "teamCell", cellType: TeamCollectionViewCell.self)){ row, item, cell in
            cell.team = item
        }
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
            let side = (tableView.frame.width - 50) / 2
            return calcColectionViewHeight(noOfItems: 15, noOfRow: 2, cellHeight: side, viewTopOffset: 50, viewBottomOffset: 20, lineSpacing: 10)
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
