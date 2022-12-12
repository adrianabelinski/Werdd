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
    
    var favoritesManager = FavoritesManager()
    
    let favoritesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorites"
        label.font = UIFont(name: "Rubik-SemiBold", size: 32)
        return label
    }()
    
    
    lazy var favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
       // tableView.delegate = self
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

// MARK: - UITableViewDataSource

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesManager.favoritedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = favoritesManager.favoritedWords[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = word.word
        return cell
    }
    
}

