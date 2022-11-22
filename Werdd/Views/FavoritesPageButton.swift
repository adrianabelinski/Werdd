//
//  FavoritesPage.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/21/22.
//

import UIKit

class FavoritesPageButton: UIButton {
    
    var completion: (() -> Void)?
    
    init(completion: (() -> Void)?, frame: CGRect = .zero) {
        super.init(frame: frame)
        
        self.completion = completion
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        tintColor = UIColor(named: "WerddPink")
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "heart.text.square", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        completion?()
    }
}
