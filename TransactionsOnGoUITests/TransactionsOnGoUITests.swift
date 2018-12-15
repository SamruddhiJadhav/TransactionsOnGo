//
//  TransactionsOnGoUITests.swift
//  TransactionsOnGoUITests
//
//  Created by Jadhav, Samruddhi on 04/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import XCTest

class TransactionsOnGoUITests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
        app.launch()
    }
    
    func testSignInSuccess() {
        let signInButton = app.buttons.element(matching: .button, identifier: "signInButton")
        if signInButton.waitForExistence(timeout: 5.0) {
            let usernameField = app.textFields.element(matching: .textField, identifier: "usernameTextField")
            usernameField.tap()
            usernameField.typeText("user")
            
            let passwordField = app.secureTextFields.element(matching: .secureTextField, identifier: "passwordTextField")
            passwordField.tap()
            passwordField.typeText("pass")
            
            signInButton.tap()
        } else {
            XCTFail()
        }
    }
    
    func testSignInFailure() {
        let signInButton = app.buttons.element(matching: .button, identifier: "signInButton")
        if signInButton.waitForExistence(timeout: 5.0) {
            let usernameField = app.textFields.element(matching: .textField, identifier: "usernameTextField")
            usernameField.tap()
            usernameField.typeText("user")
            
            let passwordField = app.secureTextFields.element(matching: .secureTextField, identifier: "passwordTextField")
            passwordField.tap()
            passwordField.typeText("password")
            
            signInButton.tap()
            let errorAlert = app.alerts
            errorAlert.buttons.element(boundBy: 0).tap()
        } else {
            XCTFail()
        }
    }
    
    
    
    func testTransactionList() {
        testSignInSuccess()
        
        app.tables.children(matching: .cell).element(boundBy: 0).tap()
        
        let benificiaryText = app.staticTexts.element(matching: .staticText, identifier: "benificiaryLabel")
        XCTAssertTrue(benificiaryText.exists)
        
        let amountSentText = app.staticTexts.element(matching: .staticText, identifier: "amountSentLabel")
        XCTAssertTrue(amountSentText.exists)
        
        let rateText = app.staticTexts.element(matching: .staticText, identifier: "rateLabel")
        XCTAssertTrue(rateText.exists)
        
        
        let feeText = app.staticTexts.element(matching: .staticText, identifier: "feeLabel")
        XCTAssertTrue(feeText.exists)
        
        let dateText = app.staticTexts.element(matching: .staticText, identifier: "dateLabel")
        XCTAssertTrue(dateText.exists)
        
        let receivedAmountText = app.staticTexts.element(matching: .staticText, identifier: "amountReceivedLabel")
        XCTAssertTrue(receivedAmountText.exists)
        
        let timeText = app.staticTexts.element(matching: .staticText, identifier: "timeLabel")
        XCTAssertTrue(timeText.exists)
    }
}
