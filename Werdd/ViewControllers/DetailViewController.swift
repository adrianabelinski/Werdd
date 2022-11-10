//
//  detailView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/4/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - Properties
  
  var entry: Entry? {
    didSet {
      guard let entry = entry else { return }
      
      title = entry.wordTitle
      
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
      exampleView.detailExampleLabel.text = entry.examples.joined(separator: "\n\n")
    }
  }
  
  let definitionView: DetailDefintionView = {
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
  
  let exampleView: DetailExampleView = {
    let view = DetailExampleView()
    view.translatesAutoresizingMaskIntoConstraints = false
  //  view.isHidden = true
    return view
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    setUpNavigationTitle()
    setUpUI()

    view.backgroundColor = UIColor(named: "Taupe")
  }
  
  func setUpNavigationTitle() {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func setUpUI() {
    setUpDefintionView()
    setUpSynonymView()
    setUpAntonymView()
    setUpExampleView()
  }
  
  func setUpDefintionView() {
    view.addSubview(definitionView)
    NSLayoutConstraint.activate([
      definitionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      definitionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      definitionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
  }
  
  func setUpSynonymView() {
    view.addSubview(synonymView)
    NSLayoutConstraint.activate([
      synonymView.topAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: 20),
      synonymView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      synonymView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
  }
  
  func setUpAntonymView() {
    view.addSubview(antonymView)
    NSLayoutConstraint.activate([
      antonymView.topAnchor.constraint(equalTo: synonymView.bottomAnchor, constant: 20),
      antonymView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      antonymView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
  }
  
  func setUpExampleView() {
    view.addSubview(exampleView)
    NSLayoutConstraint.activate([
      exampleView.topAnchor.constraint(equalTo: antonymView.bottomAnchor, constant: 20),
      exampleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      exampleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
  }
  
}
