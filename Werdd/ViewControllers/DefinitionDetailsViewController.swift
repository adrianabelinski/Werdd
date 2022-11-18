//
//  detailView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/4/22.
//

import Foundation
import UIKit

class DefinitionDetailsViewController: UIViewController {
  
  // MARK: - Properties
  
  var entry: Word? {
    didSet {
      guard let entry = entry else { return } //unwrapped entry so we wouldn't have to unwrap it all the time.
      
      title = entry.name
      
      let shortenedPartOfSpeechString: String
      switch entry.partOfSpeech {
      case .noun: shortenedPartOfSpeechString = "noun"
      case .verb: shortenedPartOfSpeechString = "verb"
      case .adjective: shortenedPartOfSpeechString = "adj."
    }
      definitionView.shortenedPartOfSpeechLabel.text = shortenedPartOfSpeechString

      definitionView.defintionDescriptionLabel.text = entry.wordDefinition
      synonymView.synonymWordsLabel.text = entry.synonyms.joined(separator: "\n\n")
      antonymView.antonymsWordsLabel.text = entry.antonyms.joined(separator: "\n\n")
      examplesView.detailExampleLabel.text = entry.examples.joined(separator: "\n\n")
    }
  }
//
//  let partOfSpeechString: String
//  switch word.partOfSpeech {
//  case .noun: partOfSpeechString = "noun"
//  case .verb: partOfSpeechString = "verb"
//  case .adjective: partOfSpeechString = "adj."
//  }
//
//  partOfSpeechLabel.text = partOfSpeechString
//
  
  let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
  }()
  
  let definitionView: DetailDefintionView = { //used to be UIView, but now it's our custom view
    let view = DetailDefintionView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let synonymView: DetailSynonymsView = {
    let view = DetailSynonymsView()
    view.translatesAutoresizingMaskIntoConstraints = false
    //view.isHidden = true
    return view
  }()
  
  let antonymView: DetailAntonymsView = {
    let view = DetailAntonymsView()
    view.translatesAutoresizingMaskIntoConstraints = false
   // view.isHidden = true
    return view
  }()
  
  let examplesView: DetailExampleView = {
    let view = DetailExampleView()
    view.translatesAutoresizingMaskIntoConstraints = false
  //  view.isHidden = true
    return view
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(named: "Taupe")
    
    setUpUI()
    setUpNavigationTitle()
  }
  
  func setUpNavigationTitle() {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func setUpUI() {
    addScrollView()
    setUpDefintionView()
    setUpSynonymView()
    setUpAntonymView()
    setUpExampleView()
  }
  
  func addScrollView() {
      view.addSubview(scrollView)
      
      NSLayoutConstraint.activate([
          scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      ])
  }
  
  func setUpDefintionView() {
    view.addSubview(definitionView)
    NSLayoutConstraint.activate([
      definitionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      definitionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      definitionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    //  definitionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    //  I was hardcoding the height here which was bad.
    ])
  }
  
  func setUpSynonymView() {
    view.addSubview(synonymView)
    NSLayoutConstraint.activate([
      synonymView.topAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: 20),
      synonymView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      synonymView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
     // synonymView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
  func setUpAntonymView() {
    view.addSubview(antonymView)
    NSLayoutConstraint.activate([
      antonymView.topAnchor.constraint(equalTo: synonymView.bottomAnchor, constant: 20),
      antonymView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      antonymView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
   //   antonymView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
  func setUpExampleView() {
    view.addSubview(examplesView)
    NSLayoutConstraint.activate([
      examplesView.topAnchor.constraint(equalTo: antonymView.bottomAnchor, constant: 20),
      examplesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      examplesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
   //   examplesView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
}
