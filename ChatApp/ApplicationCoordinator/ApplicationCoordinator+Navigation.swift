//
//  ApplicationCoordinator+Navigation.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import UIKit

extension ApplicationCoordinator {
    
    func gotoSignUp() {
        let viewModel = SignUpViewModel()
        let viewController = SignUpViewController(viewModel: viewModel)
        viewController.delegate = self
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
    
    func gotoLogin() {
        print("Redirecting to Login Screen")
    }
    
    func gotoRoom() {
        print("Redirecting to Chat Room")
    }
}
