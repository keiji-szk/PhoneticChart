//
//  Symbol.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-09.
//

import UIKit

enum Symbol{
  case ə, æ, ʊ, ɒ, ɪ, e, ʌ
  case ɜː, ɑː, uː, ɔː, iː
  case eə, ɪə, ʊə, ɔɪ, aɪ, eɪ, əʊ, aʊ
  case p, b, f, v, t, d, k, g
  case θ, ð, tʃ, dʒ, s, z, ʃ, ʒ
  case m, n, ŋ, h, l, r, w, j
  
  var text : String{
    switch(self){
    case .ə:
      return "ə"
    case .æ:
      return "æ"
    case .ʊ:
      return "ʊ"
    case .ɒ:
      return "ɒ"
    case .ɪ:
      return "ɪ"
    case .e:
      return "e"
    case .ʌ:
      return "ʌ"
    case .ɜː:
      return "ɜː"
    case .ɑː:
      return "ɑː"
    case .uː:
      return "uː"
    case .ɔː:
      return "ɔː"
    case .iː:
      return "iː"
    case .eə:
      return "eə"
    case .ɪə:
      return "ɪə"
    case .ʊə:
      return "ʊə"
    case .ɔɪ:
      return "ɔɪ"
    case .aɪ:
      return "aɪ"
    case .eɪ:
      return "eɪ"
    case .əʊ:
      return "əʊ"
    case .aʊ:
      return "aʊ"
    case .p:
      return "p"
    case .b:
      return "b"
    case .f:
      return "f"
    case .v:
      return "v"
    case .t:
      return "t"
    case .d:
      return "d"
    case .k:
      return "k"
    case .g:
      return "g"
    case .θ:
      return "θ"
    case .ð:
      return "ð"
    case .tʃ:
      return "tʃ"
    case .dʒ:
      return "dʒ"
    case .s:
      return "s"
    case .z:
      return "z"
    case .ʃ:
      return "ʃ"
    case .ʒ:
      return "ʒ"
    case .m:
      return "m"
    case .n:
      return "n"
    case .ŋ:
      return "ŋ"
    case .h:
      return "h"
    case .l:
      return "l"
    case .r:
      return "r"
    case .w:
      return "w"
    case .j:
      return "j"
    }
  }
}
