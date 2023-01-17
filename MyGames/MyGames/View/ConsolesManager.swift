//
//  ConsolesManager.swift
//  MyGames
//
//  Created by Leticia Speda on 15/01/23.
//

import CoreData

final class ConsolesManager {
    static let shared =  ConsolesManager()
    var consoles: [Console] = []
    
    func loadConsoler(with context: NSManagedObjectContext) {
        let festRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        festRequest.sortDescriptors = [sortDescriptor]
        
        do {
          consoles = try context.fetch(festRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteConsole(index: Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private init() {
        
    }
}
