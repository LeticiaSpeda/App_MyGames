//
//  NewGameViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 02/01/23.
//

import UIKit

final class NewGameViewController: UIViewController {
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 18
        stack.enableViewCode()
        return stack
    }()
    
    private lazy var name: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite o nome do jogo"
        tf.textAlignment = .center
        tf.textColor = .black
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 4
        tf.enableViewCode()
        return tf
    }()
    
    private lazy var platform: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Plataforma"
        tf.textColor = .black
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 4
        tf.enableViewCode()
        return tf
    }()
    
    private lazy var dataGame: UILabel = {
        let label = UILabel()
        label.text = "Data de Lançamento"
        label.textColor = .black
        return label
    }()
    
    private lazy var dataCalendar: UIDatePicker = {
        let calendar = UIDatePicker()
        calendar.datePickerMode = .date
        calendar.contentVerticalAlignment = .center
        calendar.contentHorizontalAlignment = .center
        calendar.enableViewCode()
        return calendar
    }()
    
    private lazy var cover: UILabel = {
        let label = UILabel()
        label.text = "Capa"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        view.enableViewCode()
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Adicionar", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 8
        bt.backgroundColor = UIColor(named: "main")
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(name)
        mainVStack.addArrangedSubview(platform)
        mainVStack.addArrangedSubview(dataGame)
        mainVStack.addArrangedSubview(dataCalendar)
        mainVStack.addArrangedSubview(cover)
        mainVStack.addArrangedSubview(image)
        mainVStack.addArrangedSubview(addButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mainVStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            name.heightAnchor.constraint(equalToConstant: 25),
            platform.heightAnchor.constraint(equalToConstant: 25),
            
        ])
    }
    private func configureStyle() {
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "main")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "Adicionar novo jogo"
    }
    
}

