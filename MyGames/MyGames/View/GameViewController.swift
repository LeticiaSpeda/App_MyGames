//
//  GameViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 28/12/22.
//

import UIKit

final class GameViewController: UIViewController {
    
    var game: Game? {
        didSet {
            name.text = game?.title
            namePlatform.text = game?.console?.name
        }
    }
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.enableViewCode()
        return stack
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = game?.title
        label.textColor = UIColor(named: Constants.color.game.rawValue)
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private lazy var namePlatform: UILabel = {
        let label = UILabel()
        label.text = game?.console?.name
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    private lazy var launchYear: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var imageGame: UIImageView = {
        let image = UIImage(named: Constants.image.noCover.rawValue)
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.enableViewCode()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let releadeDate = game?.releadeDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.locale = Locale(identifier: "pt-BR")
            launchYear.text = "Lançamento: " + formatter.string(from: releadeDate)
        }
        
        if let image = game?.cover as? UIImage {
            imageGame.image = image
        } else {
            imageGame.image = UIImage(named: Constants.image.noCoverFull.rawValue)
        }
        
    }
    
    @objc func comeBack(){
        let controller = GamesTableViewController()
        let navigation = UINavigationController(rootViewController: controller)
        present(navigation, animated: true)
    }
    
    @objc func detailsItem() {
        let controller = AddEditViewController()
        controller.onEdit = { [weak self] game in
            self?.game = game
        }
        controller.game = game
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
        mainVStack.addArrangedSubview(imageGame)
        
        [name, namePlatform,launchYear].forEach{
            $0.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
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
        ])
    }
    private func configureStyle() {
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(
            named: Constants.color.game.rawValue
        )
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = .init(
            title: Constants.GameController.button.rawValue, style: .plain,
            target: self, action: #selector(detailsItem)
        )
    }
}
