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
      title = entry?.wordTitle
    }
  }
  
  
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
    view.addSubview(exampleView)
    NSLayoutConstraint.activate([
      exampleView.topAnchor.constraint(equalTo: antonymView.bottomAnchor, constant: 20),
      exampleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      exampleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
   //   exampleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
    ])
  }
  
}
