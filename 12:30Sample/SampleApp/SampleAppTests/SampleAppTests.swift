//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Mott, Franklin E on 12/30/19.
//  Copyright © 2019 Mott, Franklin E. All rights reserved.
//

import XCTest
@testable import SampleApp

class SampleAppTests: XCTestCase {

    var vc: ViewController!
    var vm: TeamViewModel!
    
    override func setUp() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc.viewDidLoad()
        vm = vc.vm
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchRequest() {
        
    }
    func testNumOfTeams() {
        var numberOfTeams = vm.getNumOfTeams()
        XCTAssertEqual(numberOfTeams, 0, "Teams not equal to 0")
    
        let team1 = Team(id: 2, abbreviation: "Bos", city: "Boston", name: "Celtics")
        vm.teamData = [team1]
        numberOfTeams = vm.getNumOfTeams()
        XCTAssertEqual(numberOfTeams, 1, "Teams not equal to 1")
    }

    func testTeamName() {
           var teamName = vm.getTeam(at: 0)
           XCTAssertEqual(teamName, "", "Team name not empty")
       
           let team1 = Team(id: 2, abbreviation: "Bos", city: "Boston", name: "Celtics")
           vm.teamData = [team1]
           teamName = vm.getTeam(at: 0)
           XCTAssertEqual(teamName, "Celtics", "Team name not Celtics")
        
           teamName = vm.getTeam(at: 1)
                 XCTAssertEqual(teamName, "", "Team name not Celtics")
       }


    func testResponse () {
        
    }
}
