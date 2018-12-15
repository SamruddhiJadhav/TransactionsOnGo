//
//  TransactionServicesMock.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class TransactionServicesMock: TransactionServicesProtocol {
    var isNegativeTestCase = false
    
    func getTransactions(completion: @escaping ([String : Any]?, Error?) -> Void) {
        if isNegativeTestCase {
            completion(nil, nil)
        } else {
            let transaction = ["transactionId": "ACRAF23DB3C4",
                                "beneficiary": "Brother",
                                "date": "20/02/2018",
                                "amountSent": "200 GBP",
                                "amountReceived" : "17,966.61 INR",
                                "rate": "90.50733 GBP",
                                "timeTaken": "3 mins",
                                "fee": "- 1.49 GBP",
            "savedAmount": "19.79 GBP"] as [String: Any]?
            
            let jsonDict = ["transactions": [transaction]] as [String: Any]?
            completion(jsonDict, nil)
        }
    }
}
