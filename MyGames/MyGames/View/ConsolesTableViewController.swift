//
//  ListPlatformsTableViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 27/12/22.
//

import UIKit

final class ConsolesTableViewController: UITableViewController {
    
    var consolesManager = ConsolesManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            ListPlatformsViewCell.self,
            forCellReuseIdentifier: ListPlatformsViewCell.identifier
        )
        configureStyle()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadConsoles()
        tableView.reloadData()

    }

    @objc func addConsole() {
        showAlert(with: nil)
    }
    
    private func loadConsoles() {
        consolesManager.loadConsoler(with: context)
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
        
        navigationItem.rightBarButtonItem = .init(
            image: UIImage(systemName: "plus"),
            style: .plain, target: self,
            action: #selector(addConsole)
        )
    }
    
    private func showAlert(with console: Console?) {
        let tittle = console == nil ? "Adicionar" : "Editar"
        let alert = UIAlertController(
            title: tittle + " plataforma ",
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField { (textField) in
            textField.placeholder = "Nome da plataforma"
            if let name = console?.name {
                textField.text = name
            }
        }
        
        alert.addAction(
            UIAlertAction(title: tittle, style: .default, handler: { (action) in
                let console = console ?? Console(context: self.context)
                console.name = alert.textFields?.first?.text
                do {
                    try self.context.save()
                    self.loadConsoles()
                    self.tableView.reloadData()
                } catch {
                    print(error.localizedDescription)
                }
            }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        alert.view.tintColor = UIColor(named: "second")
        present(alert, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: ListPlatformsViewCell.identifier,
            for: indexPath
        ) as? ListPlatformsViewCell {
            
            let console = consolesManager.consoles[indexPath.row]
            cell.textLabel?.text = console.name
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        
        return consolesManager.consoles.count
    }
}
