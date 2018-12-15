//
//  UIWindow+ext.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

extension UIWindow {
    open override func motionEnded(_ motion: UIEventSubtype, with _: UIEvent?) {
        if motion == .motionShake {
            AppConfiguration.toggleEnvironment()
        }
        guard let viewController = rootViewController, let environment = AppConfiguration.environment  else {
            return
        }
        rootViewController?.showToastForAppConfigChange(controller: viewController,
                                                        message: String(format: StringConstants.YOU_ARE_NOW, environment.rawValue),
                                                         seconds: 2.0)
    }
}
