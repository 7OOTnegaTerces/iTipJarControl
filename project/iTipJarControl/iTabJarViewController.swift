//
//  iTabJarViewController.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 10/9/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit
import StoreKit

class iTabJarViewController: UIViewController, SKProductsRequestDelegate  {

  var product_value = ""



  func fetchAvailableProducts() {
    var productID:NSMutableSet = NSMutableSet();
    for tag in 1...3 {
      println("productID: \(iTipJarConfiguration.storeIdentifer(tag))")
      productID.addObject(iTipJarConfiguration.storeIdentifer(tag))
    }
    let productsRequest:SKProductsRequest = SKProductsRequest(productIdentifiers: productID)
    productsRequest.delegate = self
    productsRequest.start()
  }

  func productsRequest (request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
    var count : Int = response.products.count
    if (count>0) {
      var validProducts = response.products
      var validProduct: SKProduct = response.products[0] as SKProduct
      if (validProduct.productIdentifier == self.product_value) {
        println(validProduct.localizedTitle)

        println(validProduct.localizedDescription)
        println(validProduct.price)
        purchaseMyProduct(validProduct)
      } else {
        //println(validProduct.productIdentifier)
      }
    } else {
      println("Nothing found in the store")
    }
  }

  func canMakePurchases() -> Bool
  {
    return SKPaymentQueue.canMakePayments()
  }


  func purchaseMyProduct(product: SKProduct) {
    if (self.canMakePurchases()) {
      println("Purchases are allowed ...")
      var payment: SKPayment = SKPayment(product: product)
      var defaultQueue: SKPaymentQueue  = SKPaymentQueue ()

      defaultQueue.addPayment(payment)
    } else {
      println("Purchases are disabled in your device")
    }
  }


    // MARK: - Actions
  @IBAction func doneButtonPressed(sender: UIButton) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func tipButtonPressed(sender: UIButton) {
    product_value = iTipJarConfiguration.storeIdentifer(sender.tag)
    fetchAvailableProducts()

  }


}
