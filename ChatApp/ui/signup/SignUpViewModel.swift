//
//  SignUpViewModel.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import Foundation
import Firebase
import Valet

typealias SignUpForm = (email: String?, password: String?)

class SignUpViewModel {
    
    private var email: Observable<String?>
    
    private var password: Observable<String?>
    
    var form: Observable<SignUpForm?>
    
    var result: Observable<SignUpResult>
    
    private var listener: AuthStateDidChangeListenerHandle?
    
    init() {
        email = Observable(nil)
        password = Observable(nil)
        form = Observable(nil)
        result = Observable(.initial)
    }
    
    func setEmail(value: String?) {
        email.value = value
    }
    
    func setPassword(value: String?) {
        password.value = value
    }
    
    func changeData() {
        form.value = (email.value, password.value)
    }
    
    func signUp() {
        result.value = .loading
        
        let email = self.email.value ?? ""
        let password = self.password.value ?? ""
        Auth.auth().createUser(withEmail: email!, password: password!) { (authResult, error) in
            if let error = error {
                let code = AuthErrorCode(rawValue: error._code)
                switch code {
                case .invalidEmail:
                    self.result.value = .error(message: BDString.invalidEmail)
                case .emailAlreadyInUse:
                    self.result.value = .error(message: BDString.duplicateEmail)
                case .operationNotAllowed:
                    self.result.value = .error(message: BDString.operationNotAllowed)
                case .weakPassword:
                    self.result.value = .error(message: BDString.weakPassword)
                default:
                    self.result.value = .error(message: BDString.unknownError)
                }
            } else {
                self.checkUser()
            }
        }
    }
    
    private func checkUser() {
        listener = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.retrieveToken(of: user)
            } else {
                self.result.value = .error(message: BDString.userNotLoggedIn)
            }
        }
    }
    
    private func retrieveToken(of user: User) {
        user.getIDTokenForcingRefresh(true) { (token, error) in
            if let token = token {
                self.saveToken(token)
                self.result.value = .success
            } else {
                self.result.value = .error(message: BDString.tokenError)
            }
        }
    }
    
    private func saveToken(_ token: String) {
        let valet = Valet.valet(with: Identifier(nonEmpty: BDString.credentialsIdentifier)!, accessibility: .whenUnlocked)
        try? valet.setString(token, forKey: BDString.credentialsToken)
    }
    
    deinit {
        if let listener = listener {
            Auth.auth().removeStateDidChangeListener(listener)
        }
    }
}
