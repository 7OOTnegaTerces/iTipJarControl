//
//  iTipJarConfigurationTests.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 9/26/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit
import XCTest

class iTipJarConfigurationTests: XCTestCase {

  func testItShouldHaveDefaultStoreIdentifers() {

    let expected = "com.thinkful.iTipJarMaster.store.0"
    let result = iTipJarConfiguration.storeIdentifer(0)

    XCTAssertEqual(result, expected)
  }

  func testItShouldHaveDefaultStoreIdentifersEndofRange() {

    let expected = "com.thinkful.iTipJarMaster.store.2"
    let result = iTipJarConfiguration.storeIdentifer(2)

    XCTAssertEqual(result, expected)

  }

  func testItShouldSetIdentfier() {
    let expected = "com.thinkful.iTipJarMaster.store.special"

    iTipJarConfiguration.setStoreIdentifer(0, identifer: expected)
    let result = iTipJarConfiguration.storeIdentifer(0)

    XCTAssertEqual(result, expected)
    

  }
}