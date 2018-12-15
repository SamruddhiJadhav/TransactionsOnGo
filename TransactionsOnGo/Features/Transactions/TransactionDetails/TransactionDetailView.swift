//
//  TransactionDetailView.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

enum LabelType: String {
    case transactionIdLabel = "Transaction ID"
    case amountReceivedLabel = "Received"
    case feeLabel = "Fee"
    case rateLabel = "Rate"
    case dateLabel = "Date"
}

class TransactionDetailView: UIViewController, TransactionDetailViewProtocol {
    
    // MAKR: - TransactionDetailViewProtocol Variable
    var presenter: TransactionDetailPresenterProtocol?
    

    // MARK: - IBOutlet Views
    @IBOutlet var benificiaryLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var amountSentLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var feeLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var transactionIdLabel: UILabel!
    @IBOutlet var amountReceivedLabel: UILabel!
    @IBOutlet var timeTextLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAccessibiltyIdentifiers()
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.topItem?.title = StringConstants.EMPTY_LABEL
    }
    
    // MARK: - Helper Methods
    
    func setUpAccessibiltyIdentifiers() {
        benificiaryLabel.accessibilityIdentifier = StringConstants.BENEFACIARY_LABEL
        dateLabel.accessibilityIdentifier = StringConstants.DATE_LABEL
        amountSentLabel.accessibilityIdentifier = StringConstants.AMOUNT_SENT_LABEL
        rateLabel.accessibilityIdentifier = StringConstants.RATE_LABEL
        feeLabel.accessibilityIdentifier = StringConstants.FEED_LABEL
        timeLabel.accessibilityIdentifier = StringConstants.TIME_LABEL
        transactionIdLabel.accessibilityIdentifier = StringConstants.TRANSACTION_ID_LABEL
        amountReceivedLabel.accessibilityIdentifier = StringConstants.AMOUNT_RECEIVED_LABEL
        timeTextLabel.accessibilityIdentifier = StringConstants.TIME_TEXT_LABEL
    }
    
    func updateLabels() {
        guard let transaction = presenter?.transaction else {
            return
        }
        benificiaryLabel.text = transaction.beneficiary
        assignValues(.transactionIdLabel, transaction.transactionId)
        assignValues(.amountReceivedLabel, transaction.amountReceived)
        assignValues(.feeLabel, transaction.fee)
        assignValues(.rateLabel, transaction.rate)
        assignValues(.dateLabel, transaction.date)
        setUpAmountSentLabel(transaction.amountSent)
        setUpTimeLabel(transaction.timeTaken)
    }
    
    func assignValues(_ type: LabelType, _ labelValue: String?) {
        guard let labelValue = labelValue else {
            return
        }
        let labelToBeShown = "\(type.rawValue) :    \(labelValue)"
        
        switch type {
        case .transactionIdLabel:
            transactionIdLabel.text = labelToBeShown
        case .amountReceivedLabel:
            amountReceivedLabel.text = labelToBeShown
        case .feeLabel:
            feeLabel.text = labelToBeShown
        case .dateLabel:
            dateLabel.text = labelToBeShown
        case .rateLabel:
            rateLabel.text = labelToBeShown
        }
    }
    
    func setUpTimeLabel(_ timeTaken: String?) {
        guard let timeTaken = timeTaken else {
            timeLabel.text = StringConstants.EMPTY_LABEL
            timeTextLabel.text = StringConstants.DONE_IN_FEW_MINS_LABEL
            return
        }
        timeLabel.text = timeTaken
    }
    
    func setUpAmountSentLabel(_ amountSent: String?) {
        guard let amountSent = amountSent else {
            return
        }
        amountSentLabel.text = "\(StringConstants.TRANSFERRED_AMOUNT_IS_LABEL) \(amountSent)"
    }
}
