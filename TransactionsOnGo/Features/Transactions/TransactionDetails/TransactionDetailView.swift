//
//  TransactionDetailView.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionDetailView: UIViewController, TransactionDetailViewProtocol {
    var presenter: TransactionDetailPresenterProtocol?
    
    @IBOutlet var benificairyLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var feeLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var transactionIdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        navigationController?.navigationBar.isHidden = false
    }
    
    func updateLabels() {
        benificairyLabel.text = presenter?.transaction?.beneficiary ?? ""
        dateLabel.text = presenter?.transaction?.date ?? ""
        amountLabel.text = presenter?.transaction?.amount ?? ""
    }
}
