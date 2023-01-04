//
//  ListTabViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 28/12/22.
//

import UIKit

final class ListsTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screesTabBar()
        configureStyle()
    }
    
    private func screesTabBar() {
        let listGame = UINavigationController(
            rootViewController: GamesTableViewController()
        )
        let listPlatform = UINavigationController(
            rootViewController: ConsolesTableViewController()
        )
        
        listGame.tabBarItem.image = UIImage(named: "game")
        listGame.title = "Jogos"
        listPlatform.tabBarItem.image = UIImage(named: "console")
        listPlatform.title = "Plataformas"
        
        self.setViewControllers([listGame,listPlatform], animated: true)
    }
    
    private func configureStyle() {
        tabBar.tintColor = .systemPink
    }
}
