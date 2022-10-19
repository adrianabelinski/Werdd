//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit

struct Dictionary {
  let wordTitle: String
  let partsOfSpeech: String
  let wordDefinition: String
}

class HomeViewController: UIViewController {
  // UIViewController class part of uikit framework. Anything that beguns with ui is part of uikit
  
  // MARK: - Properties
  
  func setUpNavigationTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  let dictionaryWords: [Dictionary] = [
    Dictionary(wordTitle: "Coding", partsOfSpeech: "verb", wordDefinition: "the process of assigning a code to something for classification or identification."),
    Dictionary(wordTitle: "Software", partsOfSpeech: "noun", wordDefinition: "written programs or procedures or rules and associated documentation pertaining to the operation of a computer system and that are stored in read/write memory."),
    Dictionary(wordTitle: "Array", partsOfSpeech: "noun", wordDefinition: "a collection of similar types of data."),
    Dictionary(wordTitle: "Terminal", partsOfSpeech: "noun", wordDefinition: "a device at which a user enters data or commands for a computer system and which displays the received output."),
    Dictionary(wordTitle: "Programming", partsOfSpeech: "verb", wordDefinition: "creating a sequence of instructions to enable the computer to do something."),
    Dictionary(wordTitle: "Command", partsOfSpeech: "noun", wordDefinition: "an instruction for the computer. Many commands put together make up algorithms and computer programs. "),
    Dictionary(wordTitle: "Debugging", partsOfSpeech: "verb", wordDefinition: "finding and fixing problems in an algorithm or program."),
    Dictionary(wordTitle: "Digital Footprint", partsOfSpeech: "noun", wordDefinition: "the information about someone on the Internet."),
    Dictionary(wordTitle: "Event Handler", partsOfSpeech: "noun", wordDefinition: "a monitor for a specific event or action on a computer. When you write code for an event handler, it will be executed every time that event or action occurs. Many event-handlers respond to human actions such as mouse clicks."),
    Dictionary(wordTitle: "F.A.I.L.", partsOfSpeech: "noun", wordDefinition: "First Attempt In Learning "),
    Dictionary(wordTitle: "Function Call", partsOfSpeech: "noun", wordDefinition: "the piece of code that you add to a program to indicate that the program should run the code inside a function at a certain time. ")
  ]
  
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
      label.font = UIFont(name: "Rubik-Bold", size: 24)
      return label
  }()
  
  let partsOfSpeechLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = UIFont(name: "Rubik-Italic", size: 14)
      return label
  }()
  
  let wordDefinitionLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
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
      button.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
      button.setImage(image, for: .normal)
      button.tintColor = .white
      return button
  }()
  
  let padding: CGFloat = 20

  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(named: "Taupe")

    setUpNavigationTitle()
    setUpUI()
    
    if let word = dictionaryWords.first {
    updateViews(withWord: word)
    }
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
  
  @objc func randomButtonPressed() {
    
    if let randomWord = randomizedWord() {
      updateViews(withWord: randomWord)
    }
  }
  
  func randomizedWord() -> Dictionary? {
      return dictionaryWords.randomElement()
  }
  
  func updateViews(withWord word: Dictionary) {
      wordTitleLabel.text = word.wordTitle
      partsOfSpeechLabel.text = word.partsOfSpeech
      wordDefinitionLabel.text = word.wordDefinition
  }
}

