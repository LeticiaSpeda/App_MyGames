//
//  ListPlatformsViewCell.swift
//  MyGames
//
//  Created by Leticia Speda on 27/12/22.
//

import UIKit

final class ListPlatformsViewCell: UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.Error.mensage.rawValue)
    }
    
    private func configureStyle() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        backgroundColor = .white
    }
}
