//
//  Reusable.swift
//  MyGames
//
//  Created by Leticia Speda on 04/01/23.
//

import Foundation

protocol Reusable { }
extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}
