//
//  LeagueDetailsPresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import CoreData

class LeagueDetailsPresenterImpl: LeagueDetailsPresenter {
    
    private let leagueDetailsRepo: LeagueDetailsRepo
    weak var leagueDetailsViewController: LeagueDetailsViewController?
    
    init(leagueDetailsRepo: LeagueDetailsRepo, leagueDetailsViewController: LeagueDetailsViewController){
        self.leagueDetailsRepo = leagueDetailsRepo
        self.leagueDetailsViewController = leagueDetailsViewController
    }
    
    func getUpcomingEvents(by leagueId: String, and round: String) {
        if(Reachability.isConnectedToNetwork()) {
            leagueDetailsRepo.getUpcomingEvents(leagueId: leagueId, round: round, completion: { [weak self] result, error  in
                guard let data = result else {return}
                self?.leagueDetailsViewController?.upcomingEventsSubject.onNext(data.events ?? [])
            })
        } else {
            leagueDetailsViewController?.showNoInternetAlert()
        }
        
    }
    
    func getLastResults(by leagueId: String) {
        if(Reachability.isConnectedToNetwork()) {
            leagueDetailsRepo.getLastResults(leagueId: leagueId, completion: { [weak self] result, error  in
                guard let data = result else {return}
                self?.leagueDetailsViewController?.latestResultsSubject.onNext(data.events ?? [])
                guard var roundId = data.events?[0].intRound else { return }
                let intRoundId = Int(roundId)! + 1
                roundId = String(intRoundId)
                self?.getUpcomingEvents(by: leagueId, and: roundId)
            })
        } else {
            leagueDetailsViewController?.showNoInternetAlert()
        }
    }
    
    func getTeamsByLeague(by leagueName: String) {
        if(Reachability.isConnectedToNetwork()) {
            leagueDetailsRepo.getTeamsByLeague(leagueName: leagueName, completion: { [weak self] result, error in
                guard let data = result else {return}
                self?.leagueDetailsViewController?.teamsSubject.onNext(data.teams ?? [])
            })
        } else {
            leagueDetailsViewController?.showNoInternetAlert()
        }
    }
    
    func isExistInFavourites(league: League) -> Bool {
        leagueDetailsRepo.isExistInFavourites(league: league)
    }
}
