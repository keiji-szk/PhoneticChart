//
//  TileCollectionViewCell.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-09.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell {
  static let reuseIdentifier = "TileCollectionViewCell"
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 0
    stackView.distribution = .fill
    stackView.alignment = .fill
    return stackView
  }()
  
  let symbolLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
    label.textColor = UIColor.label
    label.setContentHuggingPriority(.required, for: .vertical)
    
    return label
  }()
  
  let playLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    label.textColor = UIColor.label
    label.text = "▷ "
    label.setContentHuggingPriority(.required, for: .vertical)
    return label
  }()
  
  let exampleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    label.textColor = UIColor.label
    label.setContentHuggingPriority(.required, for: .vertical)
    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    stackView.addArrangedSubview(symbolLabel)
    
    let exampleStack = UIStackView()
    exampleStack.axis = .horizontal
    exampleStack.distribution = .fill
    exampleStack.alignment = .fill
    exampleStack.addArrangedSubview(playLabel)
    exampleStack.addArrangedSubview(exampleLabel)
    stackView.addArrangedSubview(exampleStack)
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureCell(_ item: SymbolItem) {
    symbolLabel.text = item.symbol.text
    exampleLabel.attributedText = item.example
    switch(item.kind){
    case .shortVowels:
      stackView.backgroundColor = .green
    case .longVowels:
      stackView.backgroundColor = .orange
    case .dipthongs:
      stackView.backgroundColor = .yellow
    case .consonants:
      stackView.backgroundColor = .blue
    }
  }
  
  func playSound(){
    AudioManager.shared.startPlayer(track: "apple")
  }
  
  
}
