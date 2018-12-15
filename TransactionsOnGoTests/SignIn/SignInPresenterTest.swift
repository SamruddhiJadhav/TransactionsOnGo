//
//  SignInPresenterTest.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class SignInPresenterTest: XCTestCase {
  
    let view = SignInViewMock()
    let presenter = SignInPresenter()
    let wireframe = SignInWireframeMock()
    
    override func setUp() {
        super.setUp()
        presenter.view = view
        presenter.wireframe = wireframe
    }
    
    func testIsValidUser() {
        XCTAssertTrue(presenter.isValidUser("user", "pass"))
        XCTAssertFalse(presenter.isValidUser("someUser", "somePassword"))
        XCTAssertFalse(presenter.isValidUser("", ""))
    }
    
    func testSignInButtonClicked() {
        wireframe.expectations.append(expectation(description: "presentTransactionListModule()"))
        
        presenter.signInButtonClicked("user", "pass")
        
        wait(for: wireframe.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testSignInButtonClickedWithEmptyStrings() {
        view.expectations.append(expectation(description: "showErrorMessage"))
        presenter.signInButtonClicked("", "")
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
}
