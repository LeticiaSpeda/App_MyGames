//
//  ListPlatformsTableViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 27/12/22.
//

import UIKit

final class ConsolesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        tableView.register(ListPlatformsViewCell.self, forCellReuseIdentifier: ListPlatformsViewCell.identifier)
        configureStyle()
    }
    
    @objc func addConsole() {
        
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        navigationItem.title = "Lista de Plataforma"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "second")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addConsole))
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListPlatformsViewCell.identifier, for: indexPath) as? ListPlatformsViewCell {
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
    }
}
