//
//  Worker.swift
//  SampleApp
//
//  Created by Mott, Franklin E on 12/30/19.
//  Copyright © 2019 Mott, Franklin E. All rights reserved.
//

import Foundation

struct Teams: Decodable {
    let data: [Team]
}

struct Team: Decodable {
    let id: Int?
    let abbreviation: String?
    let city: String?
    let name: String?
    
    init (id: Int, abbreviation: String, city: String, name: String) {
        self.id = id
        self.abbreviation = abbreviation
        self.city = city
        self.name = name
    }

}
