//
//  EnglishSearchViewController.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-17.
//

import UIKit

class EnglishSearchViewController: UIViewController, UISearchBarDelegate {
  
  @IBOutlet var searchBar: UISearchBar!
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)
  }
  
}
