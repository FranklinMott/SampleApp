//
//  ApiRequest.swift
//  SampleApp
//
//  Created by Mott, Franklin E on 12/30/19.
//  Copyright © 2019 Mott, Franklin E. All rights reserved.
//

import Foundation

protocol TeamsWorkerProtocol{
    func getTeams(completionHandler: @escaping (Result<Teams, Error>) -> Void )
}

class TeamsWorker: TeamsWorkerProtocol{
    
    func getTeams(completionHandler: @escaping (Result<Teams, Error>) -> Void ){
        guard let url = URL(string: ApiEndpoint.endpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Bad Task:\(error.localizedDescription)")
                completionHandler(.failure(error))
            }
            if let data = data {
                
                if let teamResponse = try? JSONDecoder().decode(Teams.self, from: data) {
                    completionHandler(.success(teamResponse))
                    
                }
            }
        }.resume()
        
    }
    
    
}

