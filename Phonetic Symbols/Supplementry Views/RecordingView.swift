//
//  RecordingView.swift
//  Phonetic Symbols
//
//  Created by 鈴木啓司 on 2022-06-17.
//

import UIKit

protocol RecordingDelegate{
  func notifyHeightChanged(height: CGFloat)
}


class RecordingView: UIView {
  static var closedHeight = CGFloat(30)
  static var openHeight = CGFloat(120)
  
  @IBOutlet var recordingButton: UIButton!
  @IBOutlet var recordingStackView: UIStackView!
  var ownerView : RecordingDelegate?

  
  @IBAction func tappedRecording(_ sender: Any) {
    showRecordingView(isShow: true)
    ownerView?.notifyHeightChanged(height: RecordingView.openHeight)
  }
  @IBAction func tappedClose(_ sender: Any) {
    showRecordingView(isShow: false)
    ownerView?.notifyHeightChanged(height: RecordingView.closedHeight)
  }
  
  override init(frame: CGRect){
    super.init(frame: frame)
    loadNib()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    loadNib()
  }
  
  func showRecordingView(isShow : Bool){
    if(isShow){
      recordingButton.isHidden = true
      recordingStackView.isHidden = false
    }else{
      recordingButton.isHidden = false
      recordingStackView.isHidden = true
    }
  }

  
  func loadNib(){
    let view = Bundle.main.loadNibNamed("RecordingView", owner: self, options: nil)?.first as! UIView
    view.frame = self.bounds
    self.addSubview(view)
    RecordingView.closedHeight = recordingButton.bounds.height
    RecordingView.openHeight = recordingStackView.bounds.height
    showRecordingView(isShow: false)
  }
}
