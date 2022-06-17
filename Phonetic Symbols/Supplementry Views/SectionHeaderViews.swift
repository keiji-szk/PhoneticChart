//
//  SectionHeaderViews.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-09.
//


import UIKit

protocol SeeDetailButtonTappedDelegate{
  func notifyTapped(kind: PronunciationKind)
}


class SectionHeaderView: UICollectionReusableView {
  
  static let reuseIdentifier = "SectionHeaderView"
  var delegate: SeeDetailButtonTappedDelegate?
  var pronunciationKind: PronunciationKind?
  
  let horizontalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .center
    
    return stackView
  }()
  
  let verticalStackView: UIStackView = {
    let barView = UIView()
    barView.backgroundColor = .lightGray
    
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.addSubview(barView)
    return stackView
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textColor = .label
    
    return label
  }()
  
  let seeAllButton: UIButton = {
    let button = UIButton()
    button.setTitle("See Detail", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    button.setContentHuggingPriority(.required, for: .horizontal)
    
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    //addSubview(lineView)
    addSubview(horizontalStackView)
    
    NSLayoutConstraint.activate([
      horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
      horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      
//      lineView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
//      lineView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//      lineView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//      lineView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    horizontalStackView.addArrangedSubview(label)
    horizontalStackView.addArrangedSubview(seeAllButton)
    
    seeAllButton.addTarget(nil, action: #selector(tappedSeeAllButton(sender:)), for: .touchUpInside)
  }
  
  @objc func tappedSeeAllButton(sender: UIButton!){
    guard let delegate = self.delegate else{
      return
    }
    delegate.notifyTapped(kind: pronunciationKind!)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setTitle(_ title: String) {
    label.text = title
  }
}
