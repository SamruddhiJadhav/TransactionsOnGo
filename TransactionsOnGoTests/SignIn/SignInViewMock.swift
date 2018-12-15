//
//  SignInViewMock.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class SignInViewMock: SignInViewProtocol {
    var presenter: SignInPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    func showErrorMessage(_ message: String) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
