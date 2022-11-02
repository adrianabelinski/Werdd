//
//  OrangeTableViewCell.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/31/22.
//

import Foundation
import UIKit

class OrangeTableViewCell: UITableViewCell {
  
  
  
  
  // MARK: - UI Properties
  
  var wordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.textColor = .black
    return label
  }()
  
  var partOfSpeechLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.textColor = .black
    return label
  }()
  
  var definitionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.textColor = .black
    label.numberOfLines = 0
    return label
  }()
  
//  var backgroundColor: UIView = {
//    let view = UIView()
//    label.translatesAutoresizingMaskIntoConstraints = false
//
//    return view
//  }()
  
  // MARK: - Initializers

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUpUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - UI Setup

  private func setUpUI() {
    
    setUpWordLabel()
    setUpPartsOfSpeechLabel()
    setUpDefinitionLabel()
  }
  
  func setUpWordLabel() {
    contentView.addSubview(wordLabel)
    
    NSLayoutConstraint.activate([
      wordLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      wordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
    ])
  }
  
  func setUpPartsOfSpeechLabel() {
    contentView.addSubview(partOfSpeechLabel)
    
    NSLayoutConstraint.activate([
      partOfSpeechLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
      partOfSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 5),
    ])
  }
  
  func setUpDefinitionLabel() {
    contentView.addSubview(definitionLabel)
    
    NSLayoutConstraint.activate([
      definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
      definitionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      definitionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
    ])
  }
  
  
}
