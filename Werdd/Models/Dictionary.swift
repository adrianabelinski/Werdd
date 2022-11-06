//
//  DictionaryWords.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/19/22.
//

import Foundation

struct Dictionary {
  static let allWords: [Entry] = [
    Entry(
      wordTitle: "Coding",
      partOfSpeech: .verb,
      wordDefinition: "the process of assigning a code to something for classification or identification.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Software",
      partOfSpeech: .noun,
      wordDefinition: "written programs or procedures or rules and associated documentation pertaining to the operation of a computer system and that are stored in read/write memory.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Array",
      partOfSpeech: .noun,
      wordDefinition: "a collection of similar types of data.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Terminal",
      partOfSpeech: .noun,
      wordDefinition: "a device at which a user enters data or commands for a computer system and which displays the received output.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Programming",
      partOfSpeech: .verb,
      wordDefinition: "creating a sequence of instructions to enable the computer to do something.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Command",
      partOfSpeech: .noun,
      wordDefinition: "an instruction for the computer. Many commands put together make up algorithms and computer programs.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Debugging",
      partOfSpeech: .verb,
      wordDefinition: "finding and fixing problems in an algorithm or program.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Digital Footprint",
      partOfSpeech: .noun,
      wordDefinition: "the information about someone on the Internet.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Event Handler",
      partOfSpeech: .noun,
      wordDefinition: "a monitor for a specific event or action on a computer. When you write code for an event handler, it will be executed every time that event or action occurs. Many event-handlers respond to human actions such as mouse clicks.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "F.A.I.L.",
      partOfSpeech: .noun,
      wordDefinition: "First Attempt In Learning.",
      synonyms: [],
      antonyms: [],
      examples: []
    ),
    Entry(
      wordTitle: "Function Call",
      partOfSpeech: .noun,
      wordDefinition: "the piece of code that you add to a program to indicate that the program should run the code inside a function at a certain time.",
      synonyms: [],
      antonyms: [],
      examples: []
    )
  ]//.sorted(by: {$0.wordTitle < $1.wordTitle})
}
