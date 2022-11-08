//
//  DetailDefinitionView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailDefintionView: UIView {
  
  
  // MARK: - Properties

  let shortenedPartOfSpeechLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "dum."
    label.textColor = .black
    label.font = UIFont(name: "Rubik-Bold", size: 14)
    return label
  }()
  
  let defintionDescriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Dummy text for important words. Dummy text for important words. Dummy text for important words. Dummy text for important words. Dummy text for important words."
    label.textColor = .black
    label.font = UIFont(name: "Rubik-Light", size: 20)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    return label
  }()
  
  let definitionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Definition"
   // label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.textColor = .white
    label.font = UIFont(name: "Rubik-Bold", size: 14)
    return label
  }()
  
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
    setUpShortenedPartOfSpeech()
    setUpDefintionDescriptionLabel()
    setUpDefinitionLabel()
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Navy")
    layer.cornerRadius = 20 //This used to have view.layer.cor... etc on them, but this view is self referential.
  }
    
  func setUpShortenedPartOfSpeech() {
    addSubview(shortenedPartOfSpeechLabel)
    
    NSLayoutConstraint.activate([
      shortenedPartOfSpeechLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      shortenedPartOfSpeechLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      shortenedPartOfSpeechLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  
  func setUpDefintionDescriptionLabel() {
    addSubview(defintionDescriptionLabel)
    
    NSLayoutConstraint.activate([
      defintionDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      defintionDescriptionLabel.topAnchor.constraint(equalTo: shortenedPartOfSpeechLabel.bottomAnchor, constant: 10),
      defintionDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
    ])
  }
  
  func setUpDefinitionLabel() {
    addSubview(definitionLabel)
    
    NSLayoutConstraint.activate([
      definitionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      definitionLabel.topAnchor.constraint(equalTo: defintionDescriptionLabel.bottomAnchor, constant: 20),
      definitionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      definitionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  
  
}
