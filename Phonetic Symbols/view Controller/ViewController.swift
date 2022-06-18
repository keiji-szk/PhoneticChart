//
//  ViewController.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-07.
//

import UIKit

class ViewController: UIViewController, SeeDetailButtonTappedDelegate, RecordingDelegate {
  
  @IBOutlet var recordingView: RecordingView!
  @IBOutlet var recordingViewHeightConstraint: NSLayoutConstraint!
  
  func notifyHeightChanged(height: CGFloat) {
    recordingViewHeightConstraint.constant = height
  }
  
  func notifyTapped(kind: PronunciationKind) {
    if(kind == .consonants){
      performSegue(withIdentifier: "SeeDetail", sender: nil)
    }else{
      performSegue(withIdentifier: "SeeDetail", sender: nil)
    }
  }
  
  enum Section: Hashable{
    case shortVowels
    case longVowels
    case dipthongs
    case consonants
  }
  
  enum SupplementaryViewKind {
    static let topLine = "topLine"
    static let header = "header"
    static let bottomLine = "bottomLine"
  }
  
  @IBOutlet var symbolCollectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, SymbolItem>!
  var sections = [Section]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set delegate
    recordingView.ownerView = self
    
    // Symbol Collection View Layout
    symbolCollectionView.collectionViewLayout = createLayout()
    symbolCollectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.reuseIdentifier)
    symbolCollectionView.register(LineView.self, forSupplementaryViewOfKind: SupplementaryViewKind.topLine, withReuseIdentifier: LineView.reuseIdentifier)
    symbolCollectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: SupplementaryViewKind.header, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
    
    symbolCollectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTile)))
    
    configureDataSource()
  }
  
  
  @objc func tapTile(sender: UITapGestureRecognizer){
    let point = sender.location(in: symbolCollectionView)
    guard let indexPath = symbolCollectionView?.indexPathForItem(at: point) else{
      return
    }
    guard let cell = symbolCollectionView.cellForItem(at: indexPath) as! TileCollectionViewCell? else{
      return
    }
    cell.playSound()
  }
  
  func createLayout() -> UICollectionViewCompositionalLayout {
    return UICollectionViewCompositionalLayout{ [self] (sectionIndex, layoutEnvironment) ->
      NSCollectionLayoutSection? in
      let section = self.sections[sectionIndex]
      let layout = self.setupLayoutSymbols()
      switch section {
      case .shortVowels, .consonants:
        let lineItemHeight = 1 / layoutEnvironment.traitCollection.displayScale
        let lineItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(lineItemHeight))
        let topLineItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: lineItemSize, elementKind: SupplementaryViewKind.topLine, alignment: .top)
        
        let headerItemSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(0.92), heightDimension:.estimated(44))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: SupplementaryViewKind.header, alignment: .top)
        
        
        let supplementaryItemContentInsets = NSDirectionalEdgeInsets(top:0, leading:4, bottom:0, trailing:4)
        topLineItem.contentInsets = supplementaryItemContentInsets
        headerItem.contentInsets = supplementaryItemContentInsets

        layout.boundarySupplementaryItems = [topLineItem, headerItem]
      default:
        break
      }
      
      return layout
    }
  }
  
  func setupLayoutSymbols() -> NSCollectionLayoutSection{
    
    // MARK: Standard Section Layout
    let itemSize =
    NSCollectionLayoutSize(widthDimension:
        .fractionalWidth(1/4), heightDimension: .fractionalWidth(1/4))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4,
                                                 bottom: 4, trailing: 4)
    
    let groupSize =
    NSCollectionLayoutSize(widthDimension:
        .fractionalWidth(0.92), heightDimension: .estimated(250))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                                                  groupSize, subitem: item, count: 4)
    
    let section = NSCollectionLayoutSection(group: group)
    //section.orthogonalScrollingBehavior = .groupPagingCentered
    
    return section
  }
  
  
  
  func configureDataSource() {
    // MARK: Data Source Initialization
    dataSource = .init(collectionView: symbolCollectionView, cellProvider: {
      (collectionView, indexPath, item) -> UICollectionViewCell? in
      //let section = self.sections[indexPath.section]
      let cell =
      collectionView.dequeueReusableCell(withReuseIdentifier: TileCollectionViewCell.reuseIdentifier, for: indexPath) as! TileCollectionViewCell
      cell.configureCell(item)
      return cell
    })
    
    // MARK: Supplementary View Provider
    dataSource.supplementaryViewProvider = { collectionView, kind, indexPath -> UICollectionReusableView? in
      switch kind {
      case SupplementaryViewKind.topLine, SupplementaryViewKind.bottomLine:
        let lineView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LineView.reuseIdentifier, for: indexPath) as! LineView
        return lineView
        
      case SupplementaryViewKind.header:
        let section = self.sections[indexPath.section]
        let sectionName: String
        let pronunciationKind: PronunciationKind
        switch section {
        case .shortVowels:
          sectionName = "Vowels"
          pronunciationKind = .shortVowels
        case .consonants:
          sectionName = "Consonants"
          pronunciationKind = .consonants
        default:
          return nil
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: SupplementaryViewKind.header, withReuseIdentifier: SectionHeaderView.reuseIdentifier, for: indexPath) as! SectionHeaderView
        headerView.setTitle(sectionName)
        headerView.pronunciationKind = pronunciationKind
        headerView.delegate = self
        
        return headerView
        
      default:
        return nil
      }
    }
    

    
    // MARK: Snapshot Definition
    var snapshot = NSDiffableDataSourceSnapshot<Section, SymbolItem>()
    snapshot.appendSections([Section.shortVowels, Section.longVowels, Section.dipthongs, Section.consonants])
    snapshot.appendItems(SymbolItem.shortVowels, toSection: Section.shortVowels)
    snapshot.appendItems(SymbolItem.longVowels, toSection: Section.longVowels)
    snapshot.appendItems(SymbolItem.dipthongs, toSection: Section.dipthongs)
    snapshot.appendItems(SymbolItem.consonants, toSection: Section.consonants)
    sections = snapshot.sectionIdentifiers
    dataSource.apply(snapshot)
  }
  
  
  
}

