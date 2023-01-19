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
    
    private lazy var nameGameLabel: UITextField = {
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
    
    private lazy var platformTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = Constants.app.platform.rawValue
        tf.textColor = .black
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tf.layer.cornerRadius = 4
        tf.inputView = pickerView
        tf.inputAccessoryView = toolbar
        tf.enableViewCode()
        return tf
    }()
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .black.withAlphaComponent(0.3 )
        return picker
    }()
    
    private lazy var dataYearLabel: UILabel = {
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
    
    private(set) lazy var coverLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.AddEditController.cover.rawValue
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private(set) lazy var coverImage: UIImageView = {
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
    
    private(set) lazy var imageButton: UIButton = {
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
    
    private lazy var toolbar: UIToolbar = {
        let bar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        bar.tintColor = UIColor(named: Constants.color.game.rawValue)
        bar.items = [cancelButton,flexibleSpaceButton,doneButton]
        return bar
    }()
    
    private lazy var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        return button
    }()
    
    private lazy var doneButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        return button
    }()
    
    private lazy var flexibleSpaceButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
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
        let alert = UIAlertController(title: "Selecionar poster", message: "De onde você quer escolhero poster?", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Câmera", style: .default) { (action: UIAlertAction) in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) { (action: UIAlertAction) in
            self.selectPicture(sourceType: .photoLibrary)
        }
        
        alert.addAction(libraryAction)
        
        let photoAction = UIAlertAction(title: "Álbum de fotos", style: .default) { (action: UIAlertAction) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        
        alert.addAction(photoAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    
    @objc func addEditGame() {
        if game == nil {
            game = Game(context: context)
            game?.title = nameGameLabel.text
            game?.releadeDate = dataCalendar.date
            game?.cover = coverImage.image
            if !platformTextField.text!.isEmpty {
                let console = consolesManager.consoles[pickerView.selectedRow(inComponent: 0)]
                game?.console = console
            }
            
            do {
                try context.save()
                navigationController?.popViewController(animated: true)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func handleCancel() {
        platformTextField.resignFirstResponder()
    }
    
    @objc func handleDone() {
        platformTextField.text = consolesManager.consoles[pickerView.selectedRow(inComponent: 0)].name
        handleCancel()
    }
    
    private func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        imagePicker.navigationBar.tintColor = UIColor(named: Constants.color.game.rawValue)
        present(imagePicker, animated: true)
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(nameGameLabel)
        mainVStack.addArrangedSubview(platformTextField)
        mainVStack.addArrangedSubview(dataYearLabel)
        mainVStack.addArrangedSubview(dataCalendar)
        mainVStack.addArrangedSubview(coverLabel)
        mainVStack.addArrangedSubview(coverImage)
        mainVStack.addArrangedSubview(addButton)
        coverImage.addSubview(imageButton)
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
                equalTo: coverImage.centerXAnchor
            ),
            imageButton.centerYAnchor.constraint(
                equalTo: coverImage.centerYAnchor
            ),
            imageButton.heightAnchor.constraint(
                equalToConstant: 20
            ),
            
            nameGameLabel.heightAnchor.constraint(
                equalToConstant: 25
            ),
            platformTextField.heightAnchor.constraint(
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
