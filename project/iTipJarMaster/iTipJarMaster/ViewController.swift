//
//  ViewController.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 9/5/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKProductsRequestDelegate {
    
    var product_value = ""
    
    @IBAction func button(sender: AnyObject) {
        product_value = "test product"
        fetchAvailableProducts()
    }
    
    
    func fetchAvailableProducts() {
        var productID:NSMutableSet = NSMutableSet();
        productID.addObject("test product")
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
            println("nothing")
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
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

