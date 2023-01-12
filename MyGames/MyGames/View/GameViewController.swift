//
//  GameViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 28/12/22.
//

import UIKit

final class GameViewController: UIViewController {
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.enableViewCode()
        return stack
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Nome do jogo:"
        label.textColor = UIColor(named: "main")
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private lazy var namePlatform: UILabel = {
        let label = UILabel()
        label.text = "Plataforma:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    private lazy var launchYear: UILabel = {
        let label = UILabel()
        label.text = "Ano de lançamento:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var imageGame: UIImageView = {
        let image = UIImage(named: "noCover")
        let view = UIImageView(image: image)
        view.enableViewCode()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    @objc func comeBack(){
        let controller = GamesTableViewController()
        let navigation = UINavigationController(rootViewController: controller)
        present(navigation, animated: true)
    }
    
    @objc func detailsItem() {
        let controller = AddEditViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func commonInit(){
        configureHierarchy()
        configureConstrainst()
        configureStyle()
    }
    
    private func configureHierarchy(){
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(name)
        mainVStack.addArrangedSubview(namePlatform)
        mainVStack.addArrangedSubview(launchYear)
        mainVStack.addArrangedSubview(UIView())
        mainVStack.addArrangedSubview(imageGame)
        mainVStack.addArrangedSubview(UIView())
    }
    
    private func configureConstrainst(){
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            mainVStack.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            mainVStack.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            mainVStack.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            
            imageGame.heightAnchor.constraint(equalToConstant: 330),
            
        ])
    }
    private func configureStyle() {
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "main")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = .init(
            title: "Edit", style: .plain,
            target: self, action: #selector(detailsItem)
        )
    }
}
