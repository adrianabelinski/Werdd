//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit

class HomeViewController: BaseViewController {
  // It used to be "class HomeViewController: UIViewController" but because BaseViewController subclasses from UIViewController, we didn't have to keep it in there anymore anyway.
  // UIViewController class part of uikit framework. Anything that beguns with ui is part of uikit
  
  // MARK: - Properties
  
  let alphabetizedWords = WordDataSource.words.sorted(by: {$0.name < $1.name})
  
  let randomWordView: UIView = {
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
  
  lazy var searchView: SearchView = {
    let searchView = SearchView(searchDefinitionsDelegate: self)
    searchView.translatesAutoresizingMaskIntoConstraints = false
    searchView.layer.cornerRadius = 20
    
    // Top right corner, Top left corner
    searchView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    return searchView
  }()
  
  let dictionaryTableView: UITableView = {
    let dictionaryTableView = UITableView()
    dictionaryTableView.translatesAutoresizingMaskIntoConstraints = false
    dictionaryTableView.separatorStyle = .none
    return dictionaryTableView
  }()
  
  let padding: CGFloat = 20
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(named: "Taupe")
    
    setUpAppTitle()
    setUpUI()
    
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back")
    
    if let word = alphabetizedWords.first {
      updateViews(withWord: word)
    }
  }
  
  //get data and decode it into a usable class/struct.
  // MARK: - UI Setup
  
  func setUpAppTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  
  func setUpUI() { // view is an aspect of UIView controller
    setUpRandomWordView()
    setUpWordTitle()
    setUpPartsOfSpeech()
    setUpDefinition()
    setUpRandomButton()
    setUpSearchView()
    setUpDictionaryTableView()
  }
  
  func setUpRandomWordView() {
    view.addSubview(randomWordView)
    
    NSLayoutConstraint.activate([
      randomWordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      randomWordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      randomWordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      randomWordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
    ])
  }
  
  func setUpWordTitle() {
    randomWordView.addSubview(wordTitleLabel)
    
    NSLayoutConstraint.activate([
      wordTitleLabel.topAnchor.constraint(equalTo: randomWordView.topAnchor, constant: 20),
      wordTitleLabel.leadingAnchor.constraint(equalTo: randomWordView.leadingAnchor, constant: 20)
    ])
  }
  
  func setUpPartsOfSpeech() {
    randomWordView.addSubview(partOfSpeechLabel)
    
    NSLayoutConstraint.activate([
      partOfSpeechLabel.bottomAnchor.constraint(equalTo: wordTitleLabel.bottomAnchor, constant: -4),
      partOfSpeechLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.trailingAnchor, constant: 5),
      partOfSpeechLabel.trailingAnchor.constraint(lessThanOrEqualTo: randomWordView.trailingAnchor)
    ])
  }
  
  func setUpDefinition() {
    randomWordView.addSubview(wordDefinitionLabel)
    
    NSLayoutConstraint.activate([
      wordDefinitionLabel.topAnchor.constraint(equalTo: partOfSpeechLabel.bottomAnchor, constant: 20),
      wordDefinitionLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.leadingAnchor),
      wordDefinitionLabel.trailingAnchor.constraint(equalTo: randomWordView.trailingAnchor, constant: -20)
    ])
  }
  
  func setUpRandomButton() {
    randomWordView.addSubview(randomButton)
    
    randomButton.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      randomButton.bottomAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: -padding),
      randomButton.trailingAnchor.constraint(equalTo: randomWordView.trailingAnchor, constant: -padding),
      randomButton.heightAnchor.constraint(equalToConstant: 50),
      randomButton.widthAnchor.constraint(equalToConstant: 50),
    ])
  }
  
  func setUpSearchView() {
    view.addSubview(searchView)
    
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 35),
      searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  func setUpDictionaryTableView() {
    view.addSubview(dictionaryTableView)
    dictionaryTableView.dataSource = self
    dictionaryTableView.delegate = self
    
    NSLayoutConstraint.activate([
      dictionaryTableView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
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
  
  func randomizedWord() -> Word? {
    return alphabetizedWords.randomElement()
  }
  
  func updateViews(withWord word: Word) {
    wordTitleLabel.text = word.name
    //partOfSpeechLabel.text = word.partOfSpeech
    /*We're taking this partOfSpeechLabel and fixing it too. */
    
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

//searchController.searchBar.text

// User types in a fun word in the search bar which should be in the blank table view.
// He presses enter
// When search bar gets pressed, the words gets sent to the words api
// The api searches for that word in the database, and sends back JSON for that word
// Convert JSON into objects,
// Our app shows all the definitions for that word
// and show it in the detail screen
//
// Loading icon

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return 10
    return alphabetizedWords.count //we tell table how many rows we want
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = OrangeTableViewCell() //creating cell objects because that's what ViewController wants returned above. Boring, white cell.
    
    /* var content = cell.defaultContentConfiguration()
     
     content.text = alphabetizedWords[indexPath.row].wordTitle
     content.secondaryText = alphabetizedWords[indexPath.row].wordDefinition
     
     cell.contentConfiguration = content
     */
    
    
    cell.wordLabel.text = alphabetizedWords[indexPath.row].name //we want wordLabel to be wordTitle from alphabetized words.
    
    let partOfSpeechString: String
    switch alphabetizedWords[indexPath.row].partOfSpeech {
    case .noun: partOfSpeechString = "noun"
    case .verb: partOfSpeechString = "verb"
    case .adjective: partOfSpeechString = "adjective"
    }
    // the Word model can have just 1 property that says what part of speech the entry is and it can be an enum. And with this enum, there's other benefits. You can't make a typo. Then view controllers can see the enum and then choose how to display part of speech.
    
    cell.partOfSpeechLabel.text = partOfSpeechString
    cell.definitionLabel.text = alphabetizedWords[indexPath.row].wordDefinition
    
    
    return cell
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailViewController = DefinitionDetailsViewController()
    detailViewController.entry = alphabetizedWords[indexPath.row]
    navigationController?.pushViewController(detailViewController, animated: true)
    // Here in the delegate, we see the table view and didSelectRowAt, we created a let for detialViewController, and we called the entry to be a specific selected row. Then we push the view controller which is detailViewContoller here. Back in DefinitionDetailsViewController.swift, that's where I created the var entry to set the selected word to the title.
  }
}

// MARK: - SearchDefinitionDelegate Methods

extension HomeViewController: SearchDefinitionsDelegate {
  func searchDefinitions(forWord word: String?) {
    print("HomeViewController sees that user searched for \(word)")
  }
}
