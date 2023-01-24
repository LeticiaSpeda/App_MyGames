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
    
    //MARK: Component
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchResultsUpdater = self
        search.searchBar.tintColor = .white
        search.searchBar.barTintColor = .white
        search.searchBar.delegate = self
        return search
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        tableView.register(
            ListGameViewCell.self,
            forCellReuseIdentifier: ListGameViewCell.identifier
        )
        configureStyle()
        label.text = Constants.GameTableView.mensageTableView.rawValue
        label.textColor = .black.withAlphaComponent(0.4)
        label.textAlignment = .center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadGames()
        tableView.reloadData()
    }
    
    //MARK: Action
    @objc func addItem() {
        let controller = AddEditViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: loadGame
    private func loadGames(filtering: String = "") {
        let festRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescritor = NSSortDescriptor(
            key: Constants.GameTableView.key.rawValue,
            ascending: true
        )
        festRequest.sortDescriptors = [sortDescritor]
    
    if !filtering.isEmpty {
        let predicate = NSPredicate(format: "title contains[c] %@", argumentArray: [filtering])
        festRequest.predicate = predicate
    }
        
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
    
    //MARK: Helpers
    func configureStyle() {
        view.backgroundColor = .white
        navigationItem.title = Constants.GameTableView.title.rawValue
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(
            named: Constants.color.game.rawValue
        )
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItem = .init(
            image: UIImage(systemName: Constants.GameTableView.image.rawValue),
            style: .plain,
            target: self, action: #selector(addItem)
        )
        navigationItem.searchController = searchController
    }
    
    //MARK: ConfigTableView
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
        
        if let games = fetchedResultController?.fetchedObjects {
            controller.game = games[tableView.indexPathForSelectedRow!.row]
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let game = fetchedResultController?.fetchedObjects?[indexPath.row] else { return }
            context.delete(game) //Deletando do banco de dados
            loadGames() //Atualizando a controller que olha o banco de dados
            tableView.reloadData() //Atualiando a lista que olha a controller
        }
    }
}
//MARK: Extensions
extension GamesTableViewController: NSFetchedResultsControllerDelegate {
    private func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange anObject: Any,
        at indexPath: IndexPath?,
        for type: NSFetchedResultsChangeType,
        newnIdexPath: IndexPath?) {
            
            switch type {
            case .delete:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                break
            default:
                tableView.reloadData()
            }
        }
}

extension GamesTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadGames()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadGames(filtering: searchBar.text!)
        tableView.reloadData()
    }
}
