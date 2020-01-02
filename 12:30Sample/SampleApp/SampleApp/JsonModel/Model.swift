//
//  Model.swift
//  SampleApp
//
//  Created by Mott, Franklin E on 12/30/19.
//  Copyright © 2019 Mott, Franklin E. All rights reserved.
//

import Foundation

struct TeamResponse:Decodable {
    let data: [Team]
}

class Team: Decodable {
    let id: Int
    let abbreviation: String
    let city: String
    let name: String
}
