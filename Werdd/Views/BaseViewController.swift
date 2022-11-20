//
//  BaseViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/19/22.
//
// Creates and displays a spinner

import UIKit

class BaseViewController: UIViewController {
  
  let spinnerViewController = SpinnerViewController()
  
  /// Shows loading indicator
  func addSpinner() {
    addChild(spinnerViewController)
    spinnerViewController.view.frame = view.frame
    view.addSubview(spinnerViewController.view)
    spinnerViewController.didMove(toParent: self)
  } //It's a long story. You shouldn't care too much how it works.
  
  // Removes loading indicator
  func removeSpinner() {
    spinnerViewController.willMove(toParent: nil)
    spinnerViewController.view.removeFromSuperview()
    spinnerViewController.removeFromParent()
  }
}

