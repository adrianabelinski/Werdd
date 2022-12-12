import Foundation

struct FavoritesManager {
    
    var favoritedWords: [FavoritableWord] = [] {
        didSet {
            persistFavoritedWords()
        }
    }
    
    private var favoritedWordsKey = "favoritedWords"
    
    init() {
        populateFavoritedWords()
    }
    
    // MARK: - Public methods
    
    //tells us if a word is favorited or not
    func isFavorited(word: FavoritableWord) -> Bool { //parameter and type
        return favoritedWords.contains(word)
    }
    
    //favorites a word if is not favorited and unfavorites a word if it's favorited
    mutating func toggleIsFavorited(word: FavoritableWord) {
        let currentlyFavorited = isFavorited(word: word)
        if currentlyFavorited {
            favoritedWords.removeAll(where: { $0 == word })
        } else {
            favoritedWords.append(word)
        }
    }
    
    // MARK: - Private methods
    
    //Replaces local version of favoritesWords with UserDefaults version
    private mutating func populateFavoritedWords() {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: favoritedWordsKey) else {
            return
        }
        favoritedWords = try! decoder.decode([FavoritableWord].self, from: data)
    }
    
    //replaces UserDefault's version of favorited words with local version.
    private func persistFavoritedWords() {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(favoritedWords)
        UserDefaults.standard.set(data, forKey: favoritedWordsKey)
    }
}
