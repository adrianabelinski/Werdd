//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit

class HomeViewController: UIViewController {
  
  let blueView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.208, green: 0.506, blue: 0.722, alpha: 0.6) // #3581b8
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 25
    return view
  }()
  
  
  let stackViewVertical: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.alignment = .leading
    stackView.layer.masksToBounds = true
    return stackView
  }()
  
  let stackViewHorizontal: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.spacing = 10
    stackView.alignment = .bottom
    stackView.layer.masksToBounds = true
    return stackView
  }()
  
  let padding: CGFloat = 20


  let labelOne: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Programming"
      label.font = UIFont(name: "Rubik-Bold", size: 30)
      label.textAlignment = .center
      return label
  }()
  
  let labelTwo: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "noun"
      label.font = UIFont(name: "Rubik-Regular", size: 8)
      label.textAlignment = .center
      return label
  }()
  
  let labelThree: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "creating a sequence of instructions to enable the computer to do something."
      label.lineBreakMode = .byWordWrapping
      label.font = UIFont(name: "Rubik-Regular", size: 10)
      label.numberOfLines = 3
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
  
  
  
  
  func setUpNavigationTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.914, green: 0.902, blue: 0.894, alpha: 1) // #e9e6e4
    setUpNavigationTitle() //title sets up
    addSubviews()
    
  }

  func addSubviews() {
   // view.addSubview(titleLabel) //view is an aspect of UIView controller
    view.addSubview(blueView)
    blueView.addSubview(randomButton)
    blueView.addSubview(stackViewHorizontal)
    blueView.addSubview(labelThree)
    
    NSLayoutConstraint.activate([
      blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor),
      
      stackViewHorizontal.topAnchor.constraint(equalTo: blueView.topAnchor, constant: padding),
      stackViewHorizontal.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: padding),
      
     // labelTwo.topAnchor.constraint(equalTo: labelOne.centerYAnchor, constant: 0),
      
      labelThree.topAnchor.constraint(equalTo: stackViewHorizontal.bottomAnchor, constant: padding),
      labelThree.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: padding),
      labelThree.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: -padding),
      
      randomButton.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: -padding),
      randomButton.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: -padding),
      randomButton.heightAnchor.constraint(equalToConstant: 50),
      randomButton.widthAnchor.constraint(equalToConstant: 50),
      
      
                ])
      
    stackViewHorizontal.addArrangedSubview(labelOne)
    stackViewHorizontal.addArrangedSubview(labelTwo)
    
  //  stackView.addArrangedSubview(labelThree)
  //  stackView.addArrangedSubview(randomButton)

    
  }
  
}

//make button own floating thing and pin to bottom right of blue view.
//May need to  not use stacks on label one and two.
