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
  
  let definitionView: DetailDefintionView = { //used to be UIView, but now it's our custom view
    let view = DetailDefintionView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let synonymView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(named: "Sage")
    view.layer.cornerRadius = 20
    return view
  }()
  
  let antonymView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(named: "Cherry")
    view.layer.cornerRadius = 20
    return view
  }()
  
  let exampleView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(named: "Pumpkin")
    view.layer.cornerRadius = 20
    return view
  }()
  
  let padding: CGFloat = 20
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    setUpUI()

    view.backgroundColor = UIColor(named: "Taupe")
  }
  
  func setUpUI() {
    setUpPartOfSpeechView()
    setUpSynonymView()
    setUpAntonymView()
    setUpExampleView()
  }
  
  func setUpPartOfSpeechView() {
    view.addSubview(definitionView)
    NSLayoutConstraint.activate([
      definitionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      definitionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      definitionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      definitionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
  func setUpSynonymView() {
    view.addSubview(synonymView)
    NSLayoutConstraint.activate([
      synonymView.topAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: 20),
      synonymView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      synonymView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      synonymView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
  func setUpAntonymView() {
    view.addSubview(antonymView)
    NSLayoutConstraint.activate([
      antonymView.topAnchor.constraint(equalTo: synonymView.bottomAnchor, constant: 20),
      antonymView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      antonymView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      antonymView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
  func setUpExampleView() {
    view.addSubview(exampleView)
    NSLayoutConstraint.activate([
      exampleView.topAnchor.constraint(equalTo: antonymView.bottomAnchor, constant: 20),
      exampleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      exampleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      exampleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  

  
}
