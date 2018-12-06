//
//  TransactionDetailProtocol.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

protocol TransactionDetailViewProtocol {
    var presenter: TransactionDetailPresenterProtocol? { get set }
    
}

protocol TransactionDetailWireframeProtocol {
    var presenter: TransactionDetailPresenterProtocol? { get set }
    
    static func presentTransactionDetailModule(fromView vc: UIViewController, _ transaction: Transaction)
}

protocol TransactionDetailPresenterProtocol {
    var view: TransactionDetailViewProtocol? { get set }
    var wireframe: TransactionDetailWireframeProtocol? { get set }
    
    var transaction: Transaction? { get set }
}
