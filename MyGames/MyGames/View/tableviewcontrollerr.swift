//
//  tableviewcontrollerr.swift
//  MyGames
//
//  Created by Leticia Speda on 26/12/22.
//

import UIKit

final class tableviewcontrollerr: UITableViewController {
    
    
    override func viewDidLoad() {
        tableView.register(TableVIewCell.self, forCellReuseIdentifier: TableVIewCell.identifier)
        configureStyle()
        
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        navigationItem.title = "Lista de Jogos"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "main")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableVIewCell.identifier, for: indexPath) as? TableVIewCell {
            
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
    }
}
