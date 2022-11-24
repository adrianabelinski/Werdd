//
//  ViewController.swift
//  Werdd
//
//  Created by Han Kim on 2/7/22.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdd."
        label.font = UIFont(name: "Rubik-SemiBold", size: 32)
        return label
    }()

    lazy var favoritesPageButton: FavoritesPageButton = {
        let button = FavoritesPageButton { [weak self] in
            self?.navigationController?.pushViewController(FavoritesViewController(), animated: true)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var randomWordView: RoundedViewWithColor = {
        let view = RoundedViewWithColor(color: UIColor(named: "WerddBlue")) { [weak self] in
            self?.refreshRandomWordLabels()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/2.2, height: view.frame.size.width/3.5)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WordCollectionViewCell.self, forCellWithReuseIdentifier: WordCollectionViewCell.identifier)
        return collectionView
    }()
    
    lazy var searchView: SearchView = {
        let searchView = SearchView(searchDefinitionsDelegate: self)
//      let searchView = SearchView(homeViewController: self)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.layer.cornerRadius = 20

        // Top right corner, Top left corner
        searchView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return searchView
    }()
    
    private let networkManager: NetworkManager //This is a var that holds instance of network manager
    var words: [WordDetail]?
    var selectedWord: String?
    
    // MARK: - Initializer
    
    init(networkManager: NetworkManager = NetworkManager()) { //= networkmanager() means we're providing a default value for the networkManager parameter if the code calling the initializer doesn't provide a value.
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil) //Creating initializer here and calling superclass's initializer so super class can do it's own thing. Nibname stuff just means you're not using storyboard.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } //IGNORE 66-68 VOODOO
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Taupe")
                
        addSubviews()
        refreshRandomWordLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //fix for navigation bar staying big when navigating back to home screen.
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - UI Setup
    
    private func addSubviews() {
        view.addSubview(appTitleLabel)
        view.addSubview(favoritesPageButton)
        view.addSubview(randomWordView)
        view.addSubview(searchView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            favoritesPageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
          //  favoritesPageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favoritesPageButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            randomWordView.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 30),
            randomWordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            randomWordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            randomWordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20),
            
            searchView.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 35),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    
    private func refreshRandomWordLabels() {
        addSpinner()
        
        networkManager.fetchRandomWord { [weak self] result in
            switch result {
            case .success(let randomWord):
                DispatchQueue.main.async {
                    self?.randomWordView.wordTitleLabel.text = randomWord.word
                    self?.randomWordView.partsOfSpeechLabel.text = randomWord.results?.first?.partOfSpeech
                    self?.randomWordView.wordDefinitionLabel.text = randomWord.results?.first?.definition
                    self?.removeSpinner()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.removeSpinner()
                }
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate Methods

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordCollectionViewCell.identifier, for: indexPath) as? WordCollectionViewCell else {
            print("Expected WordTableViewCell but found nil")
            return UICollectionViewCell()
        }
                    
        cell.updateViews(words?[indexPath.row], word: selectedWord)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedWord = selectedWord,
              let selectedWordDetails = words?[indexPath.row] else {
            assertionFailure("Selected word unexpectedly found nil")
            return
        }
        
        navigationController?.pushViewController(DefinitionDetailsViewController(wordDetail: selectedWordDetails, selectedWord: selectedWord), animated: true)
    }
}

// MARK: - SearchDefinitionDelegate Methods

extension HomeViewController: SearchDefinitionsDelegate {
//extension HomeViewController {
    func searchDefinitions(forWord word: String?) {
        
        guard let word = word, !word.isEmpty else {
            presentMissingWordAlert()
            return
        }
        
        addSpinner()
        
        networkManager.fetchWordWithDetails(word) { [weak self] result in
            switch result {
            case .success(let word):
                DispatchQueue.main.async {
                    let resultsThatIncludeADefinition = word.results?.filter { $0.definition != nil }
                    self?.words = resultsThatIncludeADefinition
                    self?.selectedWord = word.word
                    self?.collectionView.reloadData()
                    self?.removeSpinner()
                }
            case .failure(let error):
                print("Failed to decode RandomWord with error: \(error.localizedDescription)")
                self?.removeSpinner()
            }
        }
    }
    
    // MARK: - Alerts
    
    private func presentMissingWordAlert() {
        let alertController = UIAlertController(
            title: "",
            message: "Please enter a word in the text field first to retrieve definitions",
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: nil)
        )
        present(alertController, animated: true, completion: nil)
    }
}
