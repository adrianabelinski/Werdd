//
//  SpinnerViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/19/22.
//

//The job of this class: Create and display a spinner.

import UIKit

final class SpinnerViewController: UIViewController { // Final class means no subclassing. UIViewController is a class that controls a UIView.
  
  let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad() // Super says Run the original overridden func (in UIViewController) first, then our code. Saves code space, reduces replicate code. We use this because we want Apple to run the code they need to which we don't know what it is.
    spinner.startAnimating()
    
    view.addSubview(spinner) //view refers to the one view of the UIViewController
    
    NSLayoutConstraint.activate([
      spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
