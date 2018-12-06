//
//  Transaction.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

struct Transaction {
    var transactionId: String?
    var beneficiary: String?
    var date: String?
    var amount: String?
    var status: String?
    var rate: String?
    var timeTaken: String?
    var fee: String?
    
    init(_ jsonDict: [String: Any?]) {
        transactionId = jsonDict["transactionId"] as? String
        beneficiary = jsonDict["beneficiary"] as? String
        date = jsonDict["date"] as? String
        amount = jsonDict["amount"] as? String
        status = jsonDict["status"] as? String
        rate = jsonDict["rate"] as? String
        timeTaken = jsonDict["timeTaken"] as? String
        fee = jsonDict["fee"] as? String
    }
}
