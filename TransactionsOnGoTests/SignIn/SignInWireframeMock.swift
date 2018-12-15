//
//  SignInWireframeMock.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class SignInWireframeMock: SignInWireframeProtocol {
    var presenter: SignInPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    static func presentSignInModule(inWindow window: UIWindow) {}
    
    func presentTransactionListModule() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
