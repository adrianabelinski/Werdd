//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit


class HomeViewController: UIViewController {
  
  // MARK: - Properties
  
  let collectionView: UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: view.frame.size.width/3.5, height: view.frame.size.width/3)
    
    let collectionView = UICollectionView(frame: 0, collectionViewLayout: <#T##UICollectionViewLayout#>)
    return collectionView
  }()
  
  let alphabetizedWords = Dictionary.allWords.sorted(by: {$0.wordTitle < $1.wordTitle})
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(named: "Navy")
    view.layer.cornerRadius = 20
    return view
  }()
  
  let wordTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Rubik-Bold", size: 24)
    return label
  }()
  
  let partOfSpeechLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Rubik-Italic", size: 14)
    return label
  }()
  
  let wordDefinitionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Rubik-Light", size: 18)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
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
  
  let dictionaryTableView: UITableView = {
    let dictionaryTableView = UITableView()
    dictionaryTableView.translatesAutoresizingMaskIntoConstraints = false
    dictionaryTableView.layer.cornerRadius = 20
    dictionaryTableView.separatorStyle = .none
    return dictionaryTableView
  }()
  
  
  let padding: CGFloat = 20
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    view.backgroundColor = UIColor(named: "Taupe")
    
    setUpNavigationTitle()
    setUpUI()
    
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back")
    
    if let word = alphabetizedWords.first {
      updateViews(withWord: word)
    }
  }
  
  
  // MARK: - UI Setup
  
  func setUpNavigationTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  
  func setUpUI() {
    setUpContainerView()
    setUpWordTitle()
    setUpPartsOfSpeech()
    setUpDefinition()
    setUpRandomButton()
    setUpDictionaryTableView()
  }
  
  func setUpContainerView() {
    view.addSubview(containerView)
    
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
    ])
  }
  
  func setUpWordTitle() {
    containerView.addSubview(wordTitleLabel)
    
    NSLayoutConstraint.activate([
      wordTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
      wordTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
    ])
  }
  
  func setUpPartsOfSpeech() {
    containerView.addSubview(partOfSpeechLabel)
    
    NSLayoutConstraint.activate([
      partOfSpeechLabel.bottomAnchor.constraint(equalTo: wordTitleLabel.bottomAnchor, constant: -4),
      partOfSpeechLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.trailingAnchor, constant: 5),
      partOfSpeechLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor)
    ])
  }
  
  func setUpDefinition() {
    containerView.addSubview(wordDefinitionLabel)
    
    NSLayoutConstraint.activate([
      wordDefinitionLabel.topAnchor.constraint(equalTo: partOfSpeechLabel.bottomAnchor, constant: 20),
      wordDefinitionLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.leadingAnchor),
      wordDefinitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
    ])
  }
  
  func setUpRandomButton() {
    containerView.addSubview(randomButton)
    
    randomButton.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      randomButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      randomButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      randomButton.heightAnchor.constraint(equalToConstant: 50),
      randomButton.widthAnchor.constraint(equalToConstant: 50),
    ])
  }
  
  func setUpDictionaryTableView() {
    view.addSubview(dictionaryTableView)
    dictionaryTableView.dataSource = self
    dictionaryTableView.delegate = self
    
    NSLayoutConstraint.activate([
      dictionaryTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
      dictionaryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      dictionaryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      dictionaryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  @objc func randomButtonPressed() {
    
    if let randomWord = randomizedWord() {
      updateViews(withWord: randomWord)
    }
  
  }
  
  func randomizedWord() -> Entry? {
    return alphabetizedWords.randomElement()
  }
  
  func updateViews(withWord word: Entry) {
    wordTitleLabel.text = word.wordTitle
    
    let partOfSpeechString: String
    switch word.partOfSpeech {
    case .noun: partOfSpeechString = "noun"
    case .verb: partOfSpeechString = "verb"
    case .adjective: partOfSpeechString = "adjective"
    }
    
    partOfSpeechLabel.text = partOfSpeechString
    
    wordDefinitionLabel.text = word.wordDefinition
  }
}




extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return 10
    return alphabetizedWords.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = OrangeTableViewCell()
    
    cell.wordLabel.text = alphabetizedWords[indexPath.row].wordTitle
    
    let partOfSpeechString: String
    switch alphabetizedWords[indexPath.row].partOfSpeech {
    case .noun: partOfSpeechString = "noun"
    case .verb: partOfSpeechString = "verb"
    case .adjective: partOfSpeechString = "adjective"
    }
    
    cell.partOfSpeechLabel.text = partOfSpeechString
    cell.definitionLabel.text = alphabetizedWords[indexPath.row].wordDefinition
    

    return cell
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailViewController = DetailViewController()
    detailViewController.entry = alphabetizedWords[indexPath.row]
    navigationController?.pushViewController(detailViewController, animated: true)
  }
}

