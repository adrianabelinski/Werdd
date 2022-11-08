//
//  DetailAntonymsView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailAntonymsView: UIView {
  
  
  // MARK: - Properties
  
  let antonymsWordsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Dummy Dummy Dummy Dummy Dummy Dummy Dummy Dummy Dummy Dummy Dummy Dummy Dummy"
    label.textColor = .black
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.font = UIFont(name: "Rubik-Light", size: 14)
    return label
  }()

  let antonymsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Antonyms"
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
    setUpAntonymsWordsLabel()
    setUpAntonymsLabel()
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Cherry")
    layer.cornerRadius = 20
  }
  
  func setUpAntonymsWordsLabel() {
    addSubview(antonymsWordsLabel)
    
    NSLayoutConstraint.activate([
      antonymsWordsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      antonymsWordsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      antonymsWordsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  func setUpAntonymsLabel() {
    addSubview(antonymsLabel)
    
    NSLayoutConstraint.activate([
      antonymsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      antonymsLabel.topAnchor.constraint(equalTo: antonymsWordsLabel.bottomAnchor, constant: 20),
      antonymsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      antonymsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
    ])
  }
  
  
}
