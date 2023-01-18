//
//  NewGameViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 02/01/23.
//

import UIKit

final class AddEditViewController: UIViewController {
    
    var game: Game?
    var consolesManager = ConsolesManager.shared
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 18
        stack.enableViewCode()
        return stack
    }()
    
    private lazy var name: UITextField = {
        let tf = UITextField()
        tf.placeholder = Constants.AddEditController.title.rawValue
        tf.textAlignment = .center
        tf.textColor = .black
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tf.layer.cornerRadius = 4
        tf.enableViewCode()
        return tf
    }()
    
    private lazy var platform: UITextField = {
        let tf = UITextField()
        tf.placeholder = Constants.app.platform.rawValue
        tf.textColor = .black
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tf.layer.cornerRadius = 4
        tf.inputView = pickerView 
        tf.enableViewCode()
        return tf
    }()
    
    private lazy var dataGame: UILabel = {
        let label = UILabel()
        label.text = Constants.AddEditController.date.rawValue
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
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    private lazy var cover: UILabel = {
        let label = UILabel()
        label.text = Constants.AddEditController.cover.rawValue
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.enableViewCode()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let bt = UIButton()
        bt.setTitle(Constants.AddEditController.button.rawValue, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 8
        bt.backgroundColor = UIColor(named: Constants.color.game.rawValue)
        bt.addTarget(self, action: #selector(addEditGame), for: .touchUpInside)
        return bt
    }()
    
    private lazy var imageButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.AddEditController.image.rawValue, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(
            self, action: #selector(clickImage),
            for: .touchUpInside
        )
        button.isUserInteractionEnabled = true
        button.enableViewCode()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        consolesManager.loadConsoler(with: context )
    }
    
    @objc func clickImage() {
        
    }
    
    @objc func addEditGame() {
        if game == nil {
            game = Game(context: context)
            game?.title = name.text
            game?.releadeDate = dataCalendar.date
            
            do {
                try context.save()
                navigationController?.popViewController(animated: true)
            } catch {
                print(error.localizedDescription)
            }
        }
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
        image.addSubview(imageButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 10
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
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -10
            ),
            
            imageButton.centerXAnchor.constraint(
                equalTo: image.centerXAnchor
            ),
            imageButton.centerYAnchor.constraint(
                equalTo: image.centerYAnchor
            ),
            imageButton.heightAnchor.constraint(
                equalToConstant: 20
            ),
            
            name.heightAnchor.constraint(
                equalToConstant: 25
            ),
            platform.heightAnchor.constraint(
                equalToConstant: 25
            ),
        ])
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: Constants.color.game.rawValue)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = Constants.AddEditController.title.rawValue
    }
}

extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consolesManager.consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let console = consolesManager.consoles[row]
        return console.name
    }
}
