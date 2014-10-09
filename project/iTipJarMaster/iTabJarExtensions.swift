//
//  iTabJarExtensions.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 10/9/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

func traverseResponderChainForUIViewController(responder: UIResponder?) -> UIResponder? {
  if let viewController = responder as? UIViewController {
    return viewController;
  }
  if let view =  responder as? UIView {
    return traverseResponderChainForUIViewController(view.nextResponder())
  }
  return nil;
}

extension UIView {

  func parentUIViewController() -> UIViewController? {
    return traverseResponderChainForUIViewController(self) as? UIViewController
  }

}
