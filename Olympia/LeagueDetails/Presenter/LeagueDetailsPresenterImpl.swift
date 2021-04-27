//
//  LeagueDetailsPresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

class LeagueDetailsPresenterImpl: LeagueDetailsPresenter {
    
    private let leagueDetailsRepo: LeagueDetailsRepo
    weak var leagueDetailsViewController: LeagueDetailsViewController?
    
    init(leagueDetailsRepo: LeagueDetailsRepo, leagueDetailsViewController: LeagueDetailsViewController){
        self.leagueDetailsRepo = leagueDetailsRepo
        self.leagueDetailsViewController = leagueDetailsViewController
    }
    
    func getUpcomingEvents() {
        leagueDetailsRepo.getUpcomingEvents (completion: { [weak self] result, error  in
            guard let data = result else {return}
            self?.leagueDetailsViewController?.upcomingEventsSubject.onNext(data.events ?? [])
        })
    }
    
    func getLastResults() {
        leagueDetailsRepo.getLastResults (completion: { [weak self] result, error  in
            guard let data = result else {return}
            self?.leagueDetailsViewController?.latestResultsSubject.onNext(data.events ?? [])
        })
    }
    
    func getTeamsByLeague() {
        leagueDetailsRepo.getTeamsByLeague(completion: { [weak self] result, error in
            guard let data = result else {return}
            self?.leagueDetailsViewController?.teamsSubject.onNext(data.teams ?? [])
        })
    }
}
