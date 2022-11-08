//
//  DetailSynonymsView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailSynonymsView: UIView {
  
  
  // MARK: - Properties

  let synonymLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Synonyms"
   // label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.textColor = .white
    label.font = UIFont(name: "Rubik-Bold", size: 14)
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
    setUpSynonymLabel()
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Sage")
    layer.cornerRadius = 20
  }
  
  
  func setUpSynonymLabel() {
    addSubview(synonymLabel)
    
    NSLayoutConstraint.activate([
      synonymLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      synonymLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      synonymLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  
}
