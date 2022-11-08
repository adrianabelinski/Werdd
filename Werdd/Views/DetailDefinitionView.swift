//
//  DetailDefinitionView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailDefintionView: UIView {
  
  
  // MARK: - Properties

  let definitionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Definition"
   // label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.textColor = .white
    label.font = UIFont(name: "Rubik-Bold", size: 12)
    return label
  }()
  
  let padding: CGFloat = 20
  
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame) //calling the initializer that exists in UIView (the superclass)
    
    setUpUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  } //This is for all of them.

  
  
  // MARK: - Lifecycle
  
  private func setUpUI() {
    setUpView()
    setUpDefinitionLabel()
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Navy")
    layer.cornerRadius = 20 //This used to have view.layer.cor... etc on them, but this view is self referential.
  }
  
  func setUpDefinitionLabel() {
    addSubview(definitionLabel)
    
    NSLayoutConstraint.activate([
      definitionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      definitionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      definitionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  
  
}
