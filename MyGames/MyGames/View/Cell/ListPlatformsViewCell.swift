//
//  ListPlatformsViewCell.swift
//  MyGames
//
//  Created by Leticia Speda on 27/12/22.
//

import UIKit

final class ListPlatformsViewCell: UITableViewCell {
    
    static let identifier = String(describing: ListPlatformsViewCell.self)
    
    private lazy var namee: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = .black
        label.enable()
        return label
    }()
    
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
        addSubview(namee)
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            namee.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            namee.leadingAnchor.constraint(equalTo: leadingAnchor),
            namee.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }
    
    private func configureStyle() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        backgroundColor = .white
    }
}
extension UIView {
    func enable() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
