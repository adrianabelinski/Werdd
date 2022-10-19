//
//  DictionaryWords.swift
//  Werdd
//
//  Created by Adriana Belinski on 10/19/22.
//

import Foundation

struct Entry {
  let wordTitle: String
  let partsOfSpeech: String
  let wordDefinition: String
}

struct Dictionary {
  static let allWords: [Entry] = [
    Entry(wordTitle: "Coding", partsOfSpeech: "verb", wordDefinition: "the process of assigning a code to something for classification or identification."),
    Entry(wordTitle: "Software", partsOfSpeech: "noun", wordDefinition: "written programs or procedures or rules and associated documentation pertaining to the operation of a computer system and that are stored in read/write memory."),
    Entry(wordTitle: "Array", partsOfSpeech: "noun", wordDefinition: "a collection of similar types of data."),
    Entry(wordTitle: "Terminal", partsOfSpeech: "noun", wordDefinition: "a device at which a user enters data or commands for a computer system and which displays the received output."),
    Entry(wordTitle: "Programming", partsOfSpeech: "verb", wordDefinition: "creating a sequence of instructions to enable the computer to do something."),
    Entry(wordTitle: "Command", partsOfSpeech: "noun", wordDefinition: "an instruction for the computer. Many commands put together make up algorithms and computer programs. "),
    Entry(wordTitle: "Debugging", partsOfSpeech: "verb", wordDefinition: "finding and fixing problems in an algorithm or program."),
    Entry(wordTitle: "Digital Footprint", partsOfSpeech: "noun", wordDefinition: "the information about someone on the Internet."),
    Entry(wordTitle: "Event Handler", partsOfSpeech: "noun", wordDefinition: "a monitor for a specific event or action on a computer. When you write code for an event handler, it will be executed every time that event or action occurs. Many event-handlers respond to human actions such as mouse clicks."),
    Entry(wordTitle: "F.A.I.L.", partsOfSpeech: "noun", wordDefinition: "First Attempt In Learning "),
    Entry(wordTitle: "Function Call", partsOfSpeech: "noun", wordDefinition: "the piece of code that you add to a program to indicate that the program should run the code inside a function at a certain time. ")
  ]
}
