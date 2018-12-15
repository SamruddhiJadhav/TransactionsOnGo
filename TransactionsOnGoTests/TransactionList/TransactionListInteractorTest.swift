//
//  TransactionListInteractorTest.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class TransactionListInteractorTest: XCTestCase {
    let interactor = TransactionListInteractor()
    let transactionService = TransactionServicesMock()
    
    override func setUp() {
        super.setUp()
        interactor.transactionService = transactionService
    }
    
    override func tearDown() {
        AppConfiguration.environment = .online
        super.tearDown()
    }
    
    func testGetTransactionsSuccess() {
        transactionService.isNegativeTestCase = false
        interactor.getTransactions(completion: { (transactions) in
            XCTAssert(transactions[0].transactionId == "ACRAF23DB3C4")
            XCTAssert(transactions[0].amountSent == "200 GBP")
            XCTAssert(transactions[0].amountReceived == "17,966.61 INR")
            XCTAssert(transactions[0].fee == "- 1.49 GBP")
            XCTAssert(transactions[0].rate == "90.50733 GBP")
            XCTAssert(transactions[0].date == "20/02/2018")
            XCTAssert(transactions[0].timeTaken == "3 mins")
            XCTAssert(transactions[0].beneficiary == "Brother")
        }) { error in
            XCTAssertNil(error)
        }
    }
    
    func testGetTransactionsForOfflineMode() {
        transactionService.isNegativeTestCase = false
        AppConfiguration.environment = .offline
        
        interactor.getTransactions(completion: { (transactions) in
            XCTAssert(transactions[0].transactionId == "ACRAF23DB3C4")
            XCTAssert(transactions[0].amountSent == "200 GBP")
            XCTAssert(transactions[0].amountReceived == "17,966.61 INR")
            XCTAssert(transactions[0].fee == "- 1.49 GBP")
            XCTAssert(transactions[0].rate == "90.50733 GBP")
            XCTAssert(transactions[0].date == "20/02/2018")
            XCTAssert(transactions[0].timeTaken == "3 mins")
            XCTAssert(transactions[0].beneficiary == "Brother")
        }) { error in
            XCTAssertNil(error)
        }
    }
    
    func testGetTransactionsFailure() {
        transactionService.isNegativeTestCase = true
        interactor.getTransactions(completion: { (transactions) in
            XCTAssertNil(transactions)
        }) { error in
            XCTAssertNotNil(error)
        }
    }
}
