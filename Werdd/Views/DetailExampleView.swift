//
//  DetailExampleView.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/6/22.
//

import UIKit

class DetailExampleView: UIView {
  
  
  // MARK: - Properties

  
  
  let padding: CGFloat = 20
  
  
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
  }

  func setUpView() {
    backgroundColor = UIColor(named: "Pumpkin")
    layer.cornerRadius = 20
  }
}
