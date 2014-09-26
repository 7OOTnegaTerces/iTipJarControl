//
//  iTipJarConfiguration.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 9/26/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import Foundation

class iTipJarConfiguration {

  //MARK: Class Methods

  /**
  Returns the store identifer for the item at index.  By default
  @param index
    Index of the tip level
  */
  class func storeIdentifer(index: Int) -> String {
      return iTipJarConfiguration.sharedInstance.identifer(index)

  }

  class func setStoreIdentifer(index: Int, identifer: String) {
    iTipJarConfiguration.sharedInstance.setIdentifer(index, identifer: identifer)
  }

  //MARK: Singleton Pattern
  // http://code.martinrue.com/posts/the-singleton-pattern-in-swift
  class var sharedInstance: iTipJarConfiguration {
  struct Static {
    static var sharedInstance: iTipJarConfiguration?
    static var token: dispatch_once_t = 0
    }

    dispatch_once(&Static.token) {
      Static.sharedInstance = iTipJarConfiguration()
    }

    return Static.sharedInstance!
  }


 //MARK: Identifers
  private var identifers = Dictionary<Int,String>()

  private var bundleIdentifer: String {
    return  NSBundle.mainBundle().bundleIdentifier ?? "com.thinkful.itipjar.store"
  }

  private func defaultIdentifer(index: Int) -> String {
      return bundleIdentifer + ".store.\(index)"
  }

  private func identifer(index: Int) -> String {
    if let result = identifers[index] {
      return result
    }
    return defaultIdentifer(index)
  }

  private func setIdentifer(index: Int, identifer: String) {
    identifers[index] = identifer
  }

}
