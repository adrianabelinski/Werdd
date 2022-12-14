//
//  NetworkManager.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/20/22.
//

import Foundation

enum APIError: LocalizedError {
    case networkError
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return NSLocalizedString("Unable to return data from network request", comment: "API returned an error")
        case .decodingError:
            return NSLocalizedString("Unable to decode", comment: "Review data models and the JSON they're trying to decode")
        }
    }
}

final class NetworkManager {
    
    /// Fetches a random word and its details
    func fetchRandomWord(completion: @escaping (Result<Word, Error>) -> Void) { // What dis mean?
        guard let randomWordDataURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true&hasDetails=definitions") else {
            completion(.failure(CommonError.invalidURL))
            return //safe code. Trying to create URL and bind it to the let. If for somereason returns a nil, return early, end execution. Can end in word or failure.
        }
        
        let headers = [
            "x-rapidapi-key": APIConstants.key,
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: randomWordDataURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers //Lines 27-40 are about creating a request.
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Fetching for random word failed with error: \(String(describing: error?.localizedDescription))")
                completion(.failure(APIError.networkError))
                return
            }
            
            do {
                let randomWord = try JSONDecoder().decode(Word.self, from: data)
                completion(.success(randomWord))
            }
            catch {
                print("Failed to decode Word with error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume() //lines 42-57 are about executing the request. It executes the request and processes the result. Then sends sends the result from any of the three completion blocks.
    }
    
    /// Fetches details for a specified word
    /// - Parameter word: Thr word in which we want additional details for
    func fetchWordWithDetails(_ word: String, completion: @escaping (Result<Word, Error>) -> Void) {
        guard let fetchWordDataURL = URL(string: "https://worsdapiv1.p.rapidapi.com/words/\(word)") else {
            completion(.failure(CommonError.invalidURL))
            return //func means fetching details for word
        }
        
        let headers = [
            "x-rapidapi-key": APIConstants.key,
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: fetchWordDataURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Fetching for word details failed with error: \(String(describing: error?.localizedDescription))")
                completion(.failure(APIError.networkError))
                return
            }
            
            do {
                let word = try JSONDecoder().decode(Word.self, from: data)
                completion(.success(word))
            }
            catch {
                print("Failed to decode Word with error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}
