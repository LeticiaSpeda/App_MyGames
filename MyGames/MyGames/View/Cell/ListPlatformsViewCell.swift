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
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
        ])
    }
    
    private func configureStyle() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        backgroundColor = .white
    }
}
