//
//  SignupViewController+UITextFieldDelegate.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import UIKit

extension SignUpViewController {
    
    func setupInteractions() {
        inputEmail.addTarget(self, action: #selector(signUpFormDidChange), for: .editingChanged)
        inputPassword.addTarget(self, action: #selector(signUpFormDidChange), for: .editingChanged)
        actionSignUp.addTarget(self, action: #selector(signUpFormDidSubmit), for: .touchUpInside)
        actionLogin.addTarget(self, action: #selector(actionLoginTapped), for: .touchUpInside)
    }
    
    @objc
    func signUpFormDidChange(sender: UITextField) {
        switch sender {
        case inputEmail:
            viewModel.setEmail(value: inputEmail.text)
        case inputPassword:
            viewModel.setPassword(value: inputPassword.text)
        default:
            return
        }
    }
    
    @objc
    func signUpFormDidSubmit() {
        viewModel.changeData()
    }
    
    @objc
    func actionLoginTapped() {
        delegate?.signUpViewControllerDidTapLogin(self)
    }
}
