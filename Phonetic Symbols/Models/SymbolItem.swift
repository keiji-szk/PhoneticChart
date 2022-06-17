//
//  SymbolItem.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-09.
//

import UIKit

struct SymbolItem: Hashable{
  let symbol: Symbol
  let kind: PronunciationKind
    
  var example : NSMutableAttributedString{
    switch(self.symbol){
    case .ə:
      let attributedString = NSMutableAttributedString()
      attributedString.append(NSAttributedString(string: "test ",
                                                 attributes: [.underlineStyle: 0]))
      attributedString.append(NSAttributedString(string: "s",
                                                 attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]))
      attributedString.append(NSAttributedString(string: "tring",
                                                 attributes: [.underlineStyle: 0]))
      return attributedString
    default:
      return NSMutableAttributedString(string: "playExample")
    }
  }
  
  static let shortVowels: [SymbolItem] = [
    SymbolItem(symbol: .ə, kind: .shortVowels),
    SymbolItem(symbol: .æ, kind: .shortVowels),
    SymbolItem(symbol: .ʊ, kind: .shortVowels),
    SymbolItem(symbol: .ɒ, kind: .shortVowels),
    SymbolItem(symbol: .ɪ, kind: .shortVowels),
    SymbolItem(symbol: .e, kind: .shortVowels),
    SymbolItem(symbol: .ʌ, kind: .shortVowels)
  ]
  
  static let longVowels: [SymbolItem] = [
    SymbolItem(symbol: .ɜː, kind: .longVowels),
    SymbolItem(symbol: .ɑː, kind: .longVowels),
    SymbolItem(symbol: .uː, kind: .longVowels),
    SymbolItem(symbol: .ɔː, kind: .longVowels),
    SymbolItem(symbol: .iː, kind: .longVowels)
  ]
  
  static let dipthongs: [SymbolItem] = [
    SymbolItem(symbol: .eə, kind: .dipthongs),
    SymbolItem(symbol: .ɪə, kind: .dipthongs),
    SymbolItem(symbol: .ʊə, kind: .dipthongs),
    SymbolItem(symbol: .ɔɪ, kind: .dipthongs),
    SymbolItem(symbol: .aɪ, kind: .dipthongs),
    SymbolItem(symbol: .eɪ, kind: .dipthongs),
    SymbolItem(symbol: .əʊ, kind: .dipthongs),
    SymbolItem(symbol: .aʊ, kind: .dipthongs)
  ]
  
  static let consonants: [SymbolItem] = [
    SymbolItem(symbol: .p, kind: .consonants),
    SymbolItem(symbol: .b, kind: .consonants),
    SymbolItem(symbol: .f, kind: .consonants),
    SymbolItem(symbol: .v, kind: .consonants),
    SymbolItem(symbol: .t, kind: .consonants),
    SymbolItem(symbol: .d, kind: .consonants),
    SymbolItem(symbol: .k, kind: .consonants),
    SymbolItem(symbol: .g, kind: .consonants),
    
    SymbolItem(symbol: .θ, kind: .consonants),
    SymbolItem(symbol: .ð, kind: .consonants),
    SymbolItem(symbol: .tʃ, kind: .consonants),
    SymbolItem(symbol: .dʒ, kind: .consonants),
    SymbolItem(symbol: .s, kind: .consonants),
    SymbolItem(symbol: .z, kind: .consonants),
    SymbolItem(symbol: .ʃ, kind: .consonants),
    SymbolItem(symbol: .ʒ, kind: .consonants),
    
    SymbolItem(symbol: .m, kind: .consonants),
    SymbolItem(symbol: .n, kind: .consonants),
    SymbolItem(symbol: .ŋ, kind: .consonants),
    SymbolItem(symbol: .h, kind: .consonants),
    SymbolItem(symbol: .l, kind: .consonants),
    SymbolItem(symbol: .r, kind: .consonants),
    SymbolItem(symbol: .w, kind: .consonants),
    SymbolItem(symbol: .j, kind: .consonants)
  ]
  
  
  
}
