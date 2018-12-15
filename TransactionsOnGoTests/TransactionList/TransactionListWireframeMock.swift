//
//  TransactionListWireframeMock.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class TransactionListWireframeMock: TransactionListWireframeProtocol {
    var presenter: TransactionListPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    static func presentTransactionListModule(fromView vc: UIViewController) {}
    
    func presentTransactionDetailModule(_ transaction: Transaction) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func popViewController() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
