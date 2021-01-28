//
//  SignUpViewController+Observer.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import UIKit

extension SignUpViewController {
    
    func setupObservers() {
        observeForm()
        observeResult()
    }
    
    private func observeForm() {
        viewModel.form.bind { (value) in
            guard let form = value else { return }
            
            let email = form.email ?? ""
            let password = form.password ?? ""
            
            if !email.isValidEmail() {
                self.errorEmail.text = BDString.invalidValue
            } else {
                self.errorEmail.text = ""
            }
            
            if !password.isValidPassword() {
                self.errorPassword.text = BDString.invalidValue
            } else {
                self.errorPassword.text = ""
            }
            
            if email.isValidEmail() && password.isValidPassword() {
                self.viewModel.signUp()
            }
        }
    }
    
    private func observeResult() {
        viewModel.result.bind { (value) in
            switch value {
            case .initial:
                self.activityIndicator.stopAnimating()
            case .loading:
                self.activityIndicator.startAnimating()
            case .success:
                self.activityIndicator.stopAnimating()
                self.delegate?.signUpViewControllerHasSuccessfulSignUp(self)
            case .error(message: let message):
                self.activityIndicator.stopAnimating()
                self.errorPassword.text = message
            }
        }
    }
}
