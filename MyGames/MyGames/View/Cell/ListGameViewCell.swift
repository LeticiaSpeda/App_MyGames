//
//  TableVIewCell.swift
//  MyGames
//
//  Created by Leticia Speda on 26/12/22.
//

import UIKit

final class ListGameViewCell: UITableViewCell {
    
    static let identifier = String(describing: ListGameViewCell.self)
    
    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.enableCode()
        return stack
    }()
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.enableCode()
        return stack
    }()
    
    private lazy var imageGame: UIImageView = {
        let image = UIImage(named: "noCover")
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        imgView.enableCode()
        return imgView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.enableCode()
        return label
    }()
    
    private lazy var consoleLabel: UILabel = {
        let label = UILabel()
        label.text = "Console:"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.enableCode()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(mainHStack)
        
        mainVStack.addArrangedSubview(nameLabel)
        mainVStack.addArrangedSubview(consoleLabel)
        mainVStack.addArrangedSubview(UIView())
        
        mainHStack.addArrangedSubview(imageGame)
        mainHStack.addArrangedSubview(mainVStack)
        mainHStack.addArrangedSubview(UIView())

    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 90),
            mainHStack.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            mainHStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainHStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainHStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            
            imageGame.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configureStyle() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        backgroundColor = .white
    }
}

extension UIView {
    func enableCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
