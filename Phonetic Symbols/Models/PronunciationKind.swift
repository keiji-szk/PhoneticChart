//
//  PronunciationKind.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-09.
//

import Foundation

enum PronunciationKind{
  case shortVowels
  case longVowels
  case dipthongs
  case consonants
  
  var diplayTitle: String{
    switch self{
    case .shortVowels:
      return "Short vowels"
    case .longVowels:
      return "Long vowels"
    case .dipthongs:
      return "Dipthongs"
    case .consonants:
      return "Consonants"
    }
  }
}
