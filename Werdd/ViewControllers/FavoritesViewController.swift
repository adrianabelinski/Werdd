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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Taupe")
        
        addSubviews()
    }
    
    // MARK: - UI Setup
    
    private func addSubviews() {
        view.addSubview(favoritesTitleLabel)
        
        NSLayoutConstraint.activate([
            favoritesTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            favoritesTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favoritesTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
    }
    
    
    
    
    
    
    
}

