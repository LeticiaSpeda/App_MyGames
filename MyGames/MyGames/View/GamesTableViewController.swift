//
//  tableviewcontrollerr.swift
//  MyGames
//
//  Created by Leticia Speda on 26/12/22.
//

import UIKit
import CoreData

final class GamesTableViewController: UITableViewController {
    
    var fetchedResultController: NSFetchedResultsController<Game>?
    var label = UILabel()
    
    var localGames: [Game] {
        fetchedResultController?.fetchedObjects ?? []
    }
    
    override func viewDidLoad() {
        tableView.register(
            ListGameViewCell.self,
            forCellReuseIdentifier: ListGameViewCell.identifier
        )
        configureStyle()
        label.text = "Você não tem jogos cadastrados"
        label.textColor = .black.withAlphaComponent(0.4)
        label.textAlignment = .center
    }
    
    @objc func addItem() {
        let controller = AddEditViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func loadGames() {
        let festRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescritor = NSSortDescriptor(key: "title", ascending: true)
        festRequest.sortDescriptors = [sortDescritor]
        
        fetchedResultController = NSFetchedResultsController(
            fetchRequest: festRequest, managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil
        )
        fetchedResultController?.delegate = self
        
        do {
            try fetchedResultController?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func configureStyle() {
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
        navigationItem.rightBarButtonItem = .init(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self, action: #selector(addItem)
        )
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let game = localGames[indexPath.row]
        
        let cell = self.tableView.dequeueReusableCell(
            withIdentifier: ListGameViewCell.identifier,
            for: indexPath
        ) as! ListGameViewCell
        cell.prepare(with: game)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        
        let count = localGames.count
        tableView.backgroundView = count == 0 ? label : nil
        
        return count
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadGames()
        tableView.reloadData()
    }
}

extension GamesTableViewController: NSFetchedResultsControllerDelegate {
    private func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange anObject: Any,
        at indexPath: IndexPath?,
        for type: NSFetchedResultsChangeType,
        newnIdexPath: IndexPath?) {
            
            switch type {
            case .delete:
                break
            default:
                tableView.reloadData()
            }
        }
}
