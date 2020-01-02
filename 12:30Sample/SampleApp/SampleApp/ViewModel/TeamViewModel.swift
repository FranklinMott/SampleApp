//
//  TeamViewModel.swift
//  SampleApp
//
//  Created by Mott, Franklin E on 12/30/19.
//  Copyright © 2019 Mott, Franklin E. All rights reserved.
//

import Foundation

protocol TeamsViewModelDelegate: class{
    func updateView()
    
}
class TeamViewModel{
    weak var delegate: TeamsViewModelDelegate?
    private var worker: TeamsWorker?
    var teamData: [Team]?{
        didSet {
            self.delegate?.updateView()
        }
    }
    init (delegate: TeamsViewModelDelegate) {
        self.delegate = delegate
        
    }
    func fetchTeams() {
        self.worker = TeamsWorker()
        self.worker?.getTeams(completionHandler: { (result) in
            switch result {
            case .success(let teams):
                self.teamData = teams.data
            case .failure(let error):
                print(error.localizedDescription)
                self.teamData = []
            }
        })
    }
    
    func getNumOfTeams() -> Int{
        guard let data = teamData else {
            return 0
        }
        return data.count
    }
    func getTeam(at index: Int) -> String{
        guard let data = teamData else {
            return ""
        }
        if index < data.count{
            return data[index].name ?? ""
        }
        return ""
    }
    
}


