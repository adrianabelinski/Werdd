import Foundation

//model for convenience to help us deal with favoriting a word
struct FavoritableWord: Codable, Equatable {
    let word: String
    let details: WordDetail
}
