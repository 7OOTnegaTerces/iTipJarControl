//
//  iTapJarPaymentTransactionObserver.swift
//  iTipJarMaster
//
//  Created by Andrew Halls on 10/9/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit
import StoreKit


class iTipJarPaymentTransactionObserver: NSObject, SKPaymentTransactionObserver {
  
  func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {

    for transaction in transactions as [SKPaymentTransaction]{
      println(transaction.payment.productIdentifier)

      switch(transaction.transactionState){

      case SKPaymentTransactionState.Purchased:
        println("Purchased")
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)

      case SKPaymentTransactionState.Purchasing :
        println("Purchasing")

      case SKPaymentTransactionState.Restored :
        println("restored")
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)

      case SKPaymentTransactionState.Deferred :
        println("deferred")

      case SKPaymentTransactionState.Failed :
        println("Failed: \(transaction.error)")

      }
    }
  }
}
