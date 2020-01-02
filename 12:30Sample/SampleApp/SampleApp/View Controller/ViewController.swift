//
//  ViewController.swift
//  SampleApp
//
//  Created by Mott, Franklin E on 12/30/19.
//  Copyright © 2019 Mott, Franklin E. All rights reserved.
//

import UIKit

extension UITableView {
    func fillIn(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let c = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ]
        NSLayoutConstraint.activate(c)
    }
}

class ViewController: UIViewController {
     lazy var tableView: UITableView =  {
        let teamTable = UITableView(frame: .zero, style: .plain)
        teamTable.register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        teamTable.dataSource = self
        teamTable.delegate = self
        view.addSubview(teamTable)
        teamTable.fillIn(self.view)
        return teamTable
        
    }()
    var vm: TeamViewModel?
    let reuseID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = TeamViewModel(delegate: self)
        vm?.fetchTeams()
       
    }


}

extension ViewController: TeamsViewModelDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getNumOfTeams() ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel?.text = vm?.getTeam(at: indexPath.row)
        return cell
    }
}

extension ViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return 
    }

}
