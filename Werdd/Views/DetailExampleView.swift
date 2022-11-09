//
//  DetailExampleView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailExampleView: UIView {
  
  
  // MARK: - Properties

  
  let detailExampleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Dummy text for important words. Dummy text for important words. Dummy text for important words. Dummy text for important words. Dummy text for important words."
    label.textColor = .black
    label.font = UIFont(name: "Rubik-Light", size: 7)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    return label
  }()
  
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
    setUpDetailExampleLabel()
    setUpExampleUsageLabel()
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Pumpkin")
    layer.cornerRadius = 20
  }
  
  func setUpDetailExampleLabel() {
    addSubview(detailExampleLabel)
    
    NSLayoutConstraint.activate([
      detailExampleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      detailExampleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      detailExampleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  func setUpExampleUsageLabel() {
    addSubview(exampleUsageLabel)
    
    NSLayoutConstraint.activate([
      exampleUsageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      exampleUsageLabel.topAnchor.constraint(equalTo: detailExampleLabel.bottomAnchor, constant: 20),
      exampleUsageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      exampleUsageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
}
