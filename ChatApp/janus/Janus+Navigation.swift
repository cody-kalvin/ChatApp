//
//  Janus+Doors.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import UIKit

extension Janus {
    
    func gotoSignUp() {
        let viewModel = SignUpViewModel()
        let viewController = SignUpViewController(viewModel: viewModel)
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
    
    func gotoLogin() {
        
    }
    
    func gotoRoom() {
        
    }
}
