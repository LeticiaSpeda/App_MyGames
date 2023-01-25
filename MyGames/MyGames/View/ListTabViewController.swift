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
        
        listGame.tabBarItem.image = UIImage(
            named: Constants.ListTabBar.imageGame.rawValue
        )
        listGame.title = Constants.ListTabBar.titleGame.rawValue
        listPlatform.tabBarItem.image = UIImage(
            named: Constants.ListTabBar.imagePlatform.rawValue
        )
        listPlatform.title = Constants.ListTabBar.titlePlatform.rawValue
        
        self.setViewControllers([listGame,listPlatform], animated: true)
    }
    
    private func configureStyle() {
        tabBar.tintColor = .systemPink
    }
}
