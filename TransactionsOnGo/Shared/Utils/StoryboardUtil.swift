//
//  StoryboardUtil.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 06/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class StoryboardUtil {
    
    // MARK: - Helper Methods
    static func instantiateView<ViewController: UIViewController>(_ storyboardID: String, _ viewStoryboardID: String) -> ViewController {
        guard let view = UIStoryboard(name: storyboardID, bundle: nil).instantiateViewController(withIdentifier: viewStoryboardID) as? ViewController else {
            fatalError("Failed to initaite for \(storyboardID) and \(viewStoryboardID)")
        }
        return view
    }
    
    static func instantiateNavigationView(_ storyboardID: String, _ viewStoryboardID: String) -> UINavigationController {
        guard let navigationController = UIStoryboard(name: storyboardID, bundle: nil).instantiateViewController(withIdentifier: viewStoryboardID) as? UINavigationController else {
            fatalError("Failed to initaite for \(storyboardID) and \(viewStoryboardID)")
        }
        return navigationController
    }
}
