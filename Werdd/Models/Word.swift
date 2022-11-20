//
//  Word.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/5/22.
//

import Foundation

struct Word: Codable {
  let word: String?
  let results: [WordDetail]?
}

struct WordDetail: Codable {
  let definition: String?
  let synonyms: [String]?
  let antonyms: [String]?
  let examples: [String]?
  let partOfSpeech: String?
}
