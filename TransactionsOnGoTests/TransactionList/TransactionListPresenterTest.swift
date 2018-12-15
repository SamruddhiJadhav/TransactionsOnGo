//
//  TransactionListPresenterTest.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class TransactionListPresenterTest: XCTestCase {
    
    let presenter = TransactionListPresenter()
    let view = TransactionListViewMock()
    let interactor = TransactionListInteractorMock()
    let wireframe = TransactionListWireframeMock()
    
    let transaction = Transaction(["transactionId": "ACRAF23DB3C4",
                                        "beneficiary": "Brother",
                                        "date": "20/02/2018",
                                        "amountSent": "200 GBP",
                                        "amountReceived" : "17,966.61 INR",
                                        "rate": "90.50733 GBP",
                                        "timeTaken": "3 mins",
                                        "fee": "- 1.49 GBP",
                                        "savedAmount": "19.79 GBP"])
    
    override func setUp() {
        super.setUp()
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
    }
    
    func testViewDidLoad() {
        view.expectations.append(expectation(description: "showLoadingIndicator()"))
        presenter.viewDidLoad()
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testDidSelectTransactionRow() {
        wireframe.expectations.append(expectation(description: "presentTransactionDetailModule"))
        presenter.didSelectTransactionRow(transaction)
        wait(for: wireframe.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testOkButtonClicked() {
        wireframe.expectations.append(expectation(description: "popViewController()"))
        presenter.okButtonClicked()
        wait(for: wireframe.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testGetTransactionsSuccess() {
        interactor.isNegativeTestCase = false
        view.expectations.append(expectation(description: "reloadTableView()"))
        presenter.getTransactions()
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testGetTransactionsFailure() {
        interactor.isNegativeTestCase = true
        view.expectations.append(expectation(description: "hideLoadingIndicator()"))
        view.expectations.append(expectation(description: "showErrorMessage"))
        presenter.getTransactions()
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
}
