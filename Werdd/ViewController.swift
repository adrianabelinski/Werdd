//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit

class ViewController: UIViewController {
  
  let blueView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.208, green: 0.506, blue: 0.722, alpha: 0.6) // #3581b8
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 25
    return view
  }()
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.alignment = .leading
    stackView.layer.masksToBounds = true
    return stackView
  }()


  let labelOne: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Programming"
      label.font = UIFont(name: "Rubik-Bold", size: 26)
      label.textAlignment = .center
      return label
  }()
  
  let labelTwo: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Noun"
      label.font = UIFont(name: "Rubik", size: 10)
      label.textAlignment = .center
      return label
  }()
  
  let labelThree: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "creating a sequence of instructions to enable the computer to do something."
      label.lineBreakMode = .byWordWrapping
      label.numberOfLines = 0
      return label
  }()
  
  let randomButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "arrow.clockwise.cirle"), for: .normal)
    button.backgroundColor = .white
    return button
  }()
  
  func setUpNavigationTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = UIColor(red: 0.914, green: 0.902, blue: 0.894, alpha: 1) // #e9e6e4
    view.addSubview(randomButton)
    setUpNavigationTitle()
    addSubviews()
    
  }

  func addSubviews() {
   // view.addSubview(titleLabel) //view is an aspect of UIView controller
    view.addSubview(blueView)
    blueView.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor),
      
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
      
                ])
      
    stackView.addArrangedSubview(labelOne)
    stackView.addArrangedSubview(labelTwo)
    stackView.addArrangedSubview(labelThree)
    stackView.addArrangedSubview(randomButton)

    
  }
}
