//
//  DetailExampleView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailExampleView: UIView {
  
  
  // MARK: - Properties

  let exampleUsageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Example Usage"
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
    setUpExampleUsageLabel()
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Pumpkin")
    layer.cornerRadius = 20
  }
  
  func setUpExampleUsageLabel() {
    addSubview(exampleUsageLabel)
    
    NSLayoutConstraint.activate([
      exampleUsageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      exampleUsageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      exampleUsageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
}
