//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit

class HomeViewController: UIViewController {
  // UIViewController class part of uikit framework. Anything that beguns with ui is part of uikit
  
  // MARK: - Properties
  
  func setUpNavigationTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(named: "Navy")
    view.layer.cornerRadius = 20
    return view
  }()
  
  let wordTitleLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Programming"
      label.font = UIFont(name: "Rubik-Bold", size: 24)
      return label
  }()
  
  let partsOfSpeechLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "noun"
      label.font = UIFont(name: "Rubik-Italic", size: 14)
      return label
  }()
  
  let wordDefinitionLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "creating a sequence of instructions to enable the computer to do something."
      label.font = UIFont(name: "Rubik-Light", size: 18)
      label.lineBreakMode = .byWordWrapping
      label.numberOfLines = 0
      return label
  }()
  
  
  let randomButton: UIButton = {
      let largeConfig = UIImage.SymbolConfiguration(
      pointSize: 140,
      weight: .regular,
      scale: .large
    )
    
      let image = UIImage(
      systemName: "arrow.clockwise.circle",
      withConfiguration: largeConfig
    )?.withTintColor(.white, renderingMode: .alwaysTemplate)
    
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setImage(image, for: .normal)
      button.tintColor = .white
      return button
  }()
  
  // MARK: - Lifecycle
  
  let padding: CGFloat = 20

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(named: "Taupe")

    setUpNavigationTitle()
    setUpUI()
  }
  
  // MARK: - UI Setup

  func setUpUI() { //view is an aspect of UIView controller
    setUpContainerView()
    setUpWordTitle()
    setUpPartsOfSpeech()
    setUpDefinition()
    setUpRandomButton()
  }

  func setUpContainerView() {
      view.addSubview(containerView)
      
      NSLayoutConstraint.activate([
          containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
          containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
          containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
          containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
      ])
  }
  
  func setUpWordTitle() {
      containerView.addSubview(wordTitleLabel)
      
      NSLayoutConstraint.activate([
          wordTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
          wordTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
      ])
  }
  
  func setUpPartsOfSpeech() {
      containerView.addSubview(partsOfSpeechLabel)
      
      NSLayoutConstraint.activate([
          partsOfSpeechLabel.bottomAnchor.constraint(equalTo: wordTitleLabel.bottomAnchor, constant: -4),
          partsOfSpeechLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.trailingAnchor, constant: 5),
          partsOfSpeechLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor)
      ])
  }
  
  func setUpDefinition() {
      containerView.addSubview(wordDefinitionLabel)
      
      NSLayoutConstraint.activate([
          wordDefinitionLabel.topAnchor.constraint(equalTo: partsOfSpeechLabel.bottomAnchor, constant: 20),
          wordDefinitionLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.leadingAnchor),
          wordDefinitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
      ])
  }
  
    func setUpRandomButton() {
      containerView.addSubview(randomButton)
      
      NSLayoutConstraint.activate([
        randomButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
        randomButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
        randomButton.heightAnchor.constraint(equalToConstant: 50),
        randomButton.widthAnchor.constraint(equalToConstant: 50),
        ])
  }
}
