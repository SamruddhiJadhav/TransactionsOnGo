//
//  TransactionListViewMock.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class TransactionListViewMock:  TransactionListViewProtocol {
    var presenter: TransactionListPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    func showErrorMessage(_ message: String) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func reloadTableView() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func showLoadingIndicator() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func hideLoadingIndicator() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
