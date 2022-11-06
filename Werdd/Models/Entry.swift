//
//  Entry.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/5/22.
//

import Foundation

struct Entry {
  enum PartOfSpeech {
    case noun
    case adjective
    case verb
  }
  
  let wordTitle: String
  let partOfSpeech: PartOfSpeech
  let wordDefinition: String
  let synonyms: [String]
  let antonyms: [String]
  let examples: [String]
}
