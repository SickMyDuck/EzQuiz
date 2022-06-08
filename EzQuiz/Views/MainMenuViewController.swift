//
//  MainMenuViewController.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import UIKit

class MainMenuViewController: UITableViewController {

    var mainMenuItems = [MainMenuItem]()
    
    var mainMenuViewModel = MainMenuViewModel()
    
    var loggedUser: Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindMainMenuViewModel()
        
        
        let flagItem = MainMenuItem.init(title: "Can you guess flags?", image: UIImage(named: "MainMenuFlagIcon")!, points: 0)
        mainMenuItems.append(flagItem)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MainMenuCell")
        self.tableView.rowHeight = 80.0
    }

    var userPoints = 0

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainMenuItems.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = #colorLiteral(red: 0.1323174536, green: 0.1567080319, blue: 0.19246611, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath)
        
        let item = mainMenuItems[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        return cell
    }

    
    func bindMainMenuViewModel() {
        
        mainMenuViewModel.flagPoints.bind { flagPoints in

            self.userPoints = flagPoints

        }
    }

}
