//
//  UiViewController+Extension.swift
//  MyGames
//
//  Created by Leticia Speda on 06/01/23.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
