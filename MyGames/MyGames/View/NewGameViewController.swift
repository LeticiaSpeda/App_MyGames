//
//  NewGameViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 02/01/23.
//

import UIKit

final class NewGameViewController: UIViewController {
    
    private lazy var name: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite o nome do jogo"
        tf.tintColor = .black
        tf.enableCodeHelper()
        return tf
    }()
    
    private lazy var platform: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Plataforma"
        tf.tintColor = .black
        tf.enableCodeHelper()
        return tf
    }()
    
    private lazy var dataGame: UILabel = {
        let label = UILabel()
        label.text = "Data de Lançamento"
        label.textColor = .black
        label.enableCodeHelper()
        return label
    }()
    
    private lazy var dataCalendar: UIDatePicker = {
        let calendar = UIDatePicker()
        calendar.datePickerMode = .date
        calendar.enableCodeHelper()
        return calendar
    }()
    
    private lazy var cover: UILabel = {
        let label = UILabel()
        label.text = "Capa"
        label.textColor = .black
        label.enableCodeHelper()
        return label
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
        view.addSubview(name)
        view.addSubview(platform)
        view.addSubview(dataGame)
        view.addSubview(dataCalendar)
        view.addSubview(cover)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            platform.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            dataGame.topAnchor.constraint(equalTo: platform.bottomAnchor, constant: 10),
            dataCalendar.topAnchor.constraint(equalTo: dataGame.bottomAnchor, constant: 15),
            cover.topAnchor.constraint(equalTo: dataCalendar.bottomAnchor, constant: 10)
            
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

extension UIView {
    func enableCodeHelper() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
