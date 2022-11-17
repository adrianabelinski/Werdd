//
//  ViewController.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/9/22.
//

import UIKit


class HomeViewController: UIViewController {
  // UIViewController class part of uikit framework. Anything that beguns with ui is part of uikit
  
  // MARK: - Properties
  
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
  
  lazy var searchController: UISearchController = {
    let s = UISearchController(searchResultsController: nil)
    s.searchResultsUpdater = self
    
    s.obscuresBackgroundDuringPresentation = false
    s.searchBar.placeholder = "Find random word..."
    s.searchBar.sizeToFit()
    s.searchBar.searchBarStyle = .prominent
    
    s.searchBar.delegate = self
    
    return s
  }()
  
  //add uitext field and a button instead of searchcontroler
  
  let padding: CGFloat = 20
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(named: "Taupe")
    
    setUpNavigationTitle()
    setUpUI()
    
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back")
    
    if let word = alphabetizedWords.first {
      updateViews(withWord: word)
    }
    
    
    // Could have written the filterContentForSearchText func.
    
    func isSearchBarEmpty() -> Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    search(word: "hi") //This call to function will be called automatically on viewDidLoad
  }
  
  func search(word: String) {
    guard let selectedWord = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)") else {
      print("Invalid URL")
      
      return
    }
    
    var urlRequest = URLRequest(url: selectedWord)
    urlRequest.httpMethod = "GET"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Accept") //not required
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") //not required
    urlRequest.setValue(APIConstants.key, forHTTPHeaderField: "X-RapidAPI-Key")
    urlRequest.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")

    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      guard let data = data, error == nil else { //make sure data is not an error
        //could do error handling here.
        return
      }
    }.resume()
  }
  
  //get data and decode it into a usable class/struct.
  // MARK: - UI Setup
  
  func setUpNavigationTitle() {
    title = "Werdd"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  
  func setUpUI() { // view is an aspect of UIView controller
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

searchController.searchBar.text

// User types in a fun word in the search bar which should be in the blank table view.
// He presses enter
// When search bar gets pressed, the words gets sent to the words api
// The api searches for that word in the database, and sends back JSON for that word
// Convert JSON into objects,
// Our app shows all the definitions for that word
// and show it in the detail screen
//
// Loading icon



extension HomeViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar) {
    
  }
}


extension HomeViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
  //  <#code#>
  }
  
}



//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
struct Word: Codable {
  let definition: String
  let partOfSpeech: String
  let synonyms: [String]
  
}


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
    
    
    cell.wordLabel.text = alphabetizedWords[indexPath.row].wordTitle //we want wordLabel to be wordTitle from alphabetized words.
    
    let partOfSpeechString: String
    switch alphabetizedWords[indexPath.row].partOfSpeech {
    case .noun: partOfSpeechString = "noun"
    case .verb: partOfSpeechString = "verb"
    case .adjective: partOfSpeechString = "adjective"
    }
    // the Entry model can have just 1 property that says what part of speech the entry is and it can be an enum. And with this enum, there's other benefits. You can't make a typo. Then view controllers can see the enum and then choose how to display part of speech.
    
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
 // Here in the delegate, we see the table view and didSelectRowAt, we created a let for detialViewController, and we called the entry to be a specific selected row. Then we push the view controller which is detailViewContoller here. Back in DetailViewController.swift, that's where I created the var entry to set the selected word to the title.
  }
}

