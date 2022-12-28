//
//  SecondViewController.swift
//  MyGames
//
//  Created by Leticia Speda on 26/12/22.
//

import UIKit

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        commonInit()
    }
    
    
    private func commonInit() {
        configureStyle()
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        //        navigationItem.title = "Ola"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "second")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        //        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}
