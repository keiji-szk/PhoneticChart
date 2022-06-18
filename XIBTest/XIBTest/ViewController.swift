//
//  ViewController.swift
//  XibTest
//
//  Created by 鈴木啓司 on 2022-06-16.
//

import UIKit

class ViewController: UIViewController, RecordDelegate {
  
  @IBOutlet var recordViewHeightConstrain: NSLayoutConstraint!
  @IBOutlet var xibView: XibView!
  
  func notifyHeightChanged(height: CGFloat) {
    recordViewHeightConstrain.constant = height
    XibView.heightChangeAnimate(uiview: xibView, heightConstrain: recordViewHeightConstrain, height: height)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    xibView.observer = self
    recordViewHeightConstrain.constant = XibView.closedHeight
  }


}

