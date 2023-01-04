//
//  tableviewcontrollerr.swift
//  MyGames
//
//  Created by Leticia Speda on 26/12/22.
//

import UIKit

final class GamesTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        tableView.register(ListGameViewCell.self, forCellReuseIdentifier: ListGameViewCell.identifier)
        configureStyle()
        
    }
    
    @objc func addItem() {
        let controller = NewGameViewController()
        navigationController?.pushViewController(controller, animated: true)
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
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addItem))
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListGameViewCell.identifier, for: indexPath) as? ListGameViewCell {
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
    }
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
