//
//  XibView.swift
//  XibTest
//
//  Created by 鈴木啓司 on 2022-06-16.
//

import UIKit

protocol RecordDelegate{
  func notifyHeightChanged(height: CGFloat)
}

class XibView: UIView {
  static var closedHeight = CGFloat(30)
  static var openHeight = CGFloat(120)
  
  var observer : RecordDelegate?
  
  @IBOutlet var recordingStackView: UIStackView!
  @IBOutlet var tapmeButton: UIButton!
  
  override init(frame: CGRect){
    super.init(frame: frame)
    loadNib()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    loadNib()
  }
  
  static func heightChangeAnimate(uiview : UIView, heightConstrain : NSLayoutConstraint, height : CGFloat){
    UIView.animate(withDuration: 1) {
      heightConstrain.constant = height
      uiview.layoutIfNeeded()
    }
  }
  
  
  func loadNib(){
    let view = Bundle.main.loadNibNamed("XibView", owner: self, options: nil)?.first as! UIView
    view.frame = self.bounds
    self.addSubview(view)
    XibView.closedHeight = tapmeButton.bounds.height
    XibView.openHeight = recordingStackView.bounds.height
    
    showRecordingView(isShow: false)
  }
  
  @IBAction func tappedButton(_ sender: Any) {
    showRecordingView(isShow: true)
    observer?.notifyHeightChanged(height: XibView.openHeight)
  }
  
  @IBAction func tappedCloseButton(_ sender: Any) {
    showRecordingView(isShow: false)
    observer?.notifyHeightChanged(height: XibView.closedHeight)
  }
  
  func showRecordingView(isShow : Bool){
    if(isShow){
      tapmeButton.isHidden = true
      recordingStackView.isHidden = false
    }else{
      tapmeButton.isHidden = false
      recordingStackView.isHidden = true
    }
  }
  
  
}
