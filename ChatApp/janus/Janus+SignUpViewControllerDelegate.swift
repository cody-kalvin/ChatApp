//
//  Janus+SignUpViewControllerDelegate.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import UIKit

extension Janus: SignUpViewControllerDelegate {
    
    func signUpViewControllerHasSuccessfulSignUp(_ viewController: SignUpViewController) {
        gotoRoom()
    }
    
    func signUpViewControllerDidTapLogin(_ viewController: SignUpViewController) {
        gotoLogin()
    }
}
