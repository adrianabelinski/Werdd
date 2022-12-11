import Foundation

struct FavoritesManager {
    
    //tells us if a word is favorited or not
    func isFavorited(word: FavoritableWord) -> Bool { //parameter and type
        let key = userDefaultsKeyFor(word: word)
        return UserDefaults.standard.bool(forKey: key)
    }
    
    //favorites a word if is not favorited and unfavorites a word if it's favorited
    func toggleIsFavorited(word: FavoritableWord) {
        let key = userDefaultsKeyFor(word: word)

        let currentlyFavorited = isFavorited(word: word)
        if currentlyFavorited {
            UserDefaults.standard.set(false, forKey: key)
        } else {
            UserDefaults.standard.set(true, forKey: key)
        }
    }
    
    //generates key string for the given word
    private func userDefaultsKeyFor(word: FavoritableWord) -> String {
        return "isFavoriteButtonEnabled.\(word.word).\(word.details.definition ?? "")"
    }
}
