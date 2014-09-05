//
//  iTipJarControl.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 9/5/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

/**
*  Drop in replacement for a UIButton that offers the users a opportunity to give a tip or donation via In-app purchases
*  The buttonPressed action displays an Alert view that confirms the contribution.
*/
class iTipJarControl: UIButton {

  override init() {
    super.init()
    commonInit()

  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
      commonInit()
  }

  private func commonInit() {
    self.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
  }

  @objc(buttonPressed:) private func buttonPressed(sender: AnyObject? ) {
    UIAlertView(title: "Tip Jar", message: "Thank you for your tip", delegate: nil, cancelButtonTitle: "Ok")
      .show()
  }
}
