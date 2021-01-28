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

        if let email = self.email.value ?? "", let password = self.password.value ?? "" {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
                guard let self = self else { return }

                if let error = error {
                    let code = AuthErrorCode(rawValue: error._code)
                    switch code {
                    case .invalidEmail:
                        self.result.value = .error(message: KString.invalidEmail)
                    case .emailAlreadyInUse:
                        self.result.value = .error(message: KString.duplicateEmail)
                    case .operationNotAllowed:
                        self.result.value = .error(message: KString.operationNotAllowed)
                    case .weakPassword:
                        self.result.value = .error(message: KString.weakPassword)
                    default:
                        self.result.value = .error(message: KString.unknownError)
                    }
                } else {
                    self.checkUser()
                }
            }
        }
    }

    private func checkUser() {
        listener = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let self = self else { return }
            if let user = user {
                self.retrieveToken(of: user)
            } else {
                self.result.value = .error(message: KString.userNotLoggedIn)
            }
        }
    }

    private func retrieveToken(of user: User) {
        user.getIDTokenForcingRefresh(true) { [weak self] (token, error) in
            guard let self = self else { return }
            if let token = token {
                self.saveToken(token)
                self.result.value = .success
            } else {
                self.result.value = .error(message: KString.tokenError)
            }
        }
    }

    private func saveToken(_ token: String) {
        let valet = Valet.valet(with: Identifier(nonEmpty: KString.credentialsIdentifier)!, accessibility: .whenUnlocked)
        try? valet.setString(token, forKey: KString.credentialsToken)
    }

    deinit {
        if let listener = listener {
            Auth.auth().removeStateDidChangeListener(listener)
        }
    }
}
