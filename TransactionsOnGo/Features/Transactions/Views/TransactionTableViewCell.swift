//
//  TransactionTableViewCell.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet var beneficiaryLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    func configureCell(_ transaction: Transaction) {
        beneficiaryLabel.text = transaction.beneficiary
        amountLabel.text = transaction.amount
    }
}
