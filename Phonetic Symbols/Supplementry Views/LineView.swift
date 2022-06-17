//
//  LineView.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-09.
//

import UIKit

class LineView: UICollectionReusableView {
  static let reuseIdentifier = "LineView"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .lightGray
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
//  func setColor(_ color: UIColor) {
//    backgroundColor = color
//  }
}
