//
//  FlowCoordinator.swift
//  nearby-nlw
//
//  Created by Julio Zambom on 09/12/24.
//

import Foundation
import UIKit

class NearbyFlowController {
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let contentView = SplashView()
        let startViewController = SplashViewController(contentView: contentView, delegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

extension NearbyFlowController: SplashFlowDelegate {
    func decideNavigationFlow() {
        let contentView = WelcomeView()
        let welcomeViewController = WelcomeViewController(contentView: contentView)
        let homeViewController = HomeViewController()
        
        let alreadyOppenedTheAppKey = "nearby@alreadyOppenedTheApp"
        
        let defaults = UserDefaults.standard;
        let alreadyOppenedTheApp = defaults.bool(forKey: alreadyOppenedTheAppKey);
        
        var nextViewController: UIViewController
        
        if alreadyOppenedTheApp {
            nextViewController = homeViewController
        } else {
            welcomeViewController.flowDelegate = self
            nextViewController = welcomeViewController
            defaults.set(true, forKey: alreadyOppenedTheAppKey)
        }
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension NearbyFlowController: WelcomeFlowDelegate {
    func goToHome() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
