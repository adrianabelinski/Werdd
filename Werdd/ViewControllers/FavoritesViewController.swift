//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/21/22.
//

import Foundation
import UIKit

final class FavoritesViewController: UIViewController {
    
    // MARK: - Properties
    
    let favoritesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorites"
        label.font = UIFont(name: "Rubik-SemiBold", size: 32)
        return label
    }()
    
    
    let favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.dataSource = self
//        tableView.delegate = self
        //tableView.regis
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Taupe")
        
        addSubviews()
    }
    
    // MARK: - UI Setup
    
    private func addSubviews() {
        view.addSubview(favoritesTitleLabel)
        view.addSubview(favoritesTableView)
        
        NSLayoutConstraint.activate([
            favoritesTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            favoritesTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favoritesTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            favoritesTableView.topAnchor.constraint(equalTo: favoritesTitleLabel.bottomAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    
    
    
    
    
    
}

