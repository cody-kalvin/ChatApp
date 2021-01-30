//
//  SignUpForm.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/25/21.
//

import UIKit
import SnapKit

extension SignUpViewController {

    func setupSubviews() {
        setupScrollView()
        setupContentView()
        setupInputEmail()
        setupErrorEmail()
        setupInputPassword()
        setupErrorPassword()
        setupActionSignUp()
        setupActionLogin()
        setupTextTerms()
        setupActivityIndicator()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.greaterThanOrEqualTo(view)
        }
    }

    private func setupContentView() {
        scrollView.addSubview(contentView)

        contentView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.bottom.equalTo(scrollView)
        }
    }

    private func setupInputEmail() {
        contentView.addSubview(inputEmail)

        inputEmail.placeholder = "Email"
        inputEmail.keyboardType = .emailAddress
        inputEmail.returnKeyType = .next
        inputEmail.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(40.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
        }
    }

    private func setupErrorEmail() {
        contentView.addSubview(errorEmail)

        errorEmail.font = .systemFont(ofSize: 16)
        errorEmail.textColor = .red
        errorEmail.snp.makeConstraints { (make) in
            make.top.equalTo(inputEmail.snp.bottom).offset(10.0)
            make.left.right.equalTo(inputEmail)
        }
    }

    private func setupInputPassword() {
        contentView.addSubview(inputPassword)

        inputPassword.placeholder = "Password"
        inputPassword.keyboardType = .default
        inputPassword.isSecureTextEntry = true
        inputPassword.returnKeyType = .done
        inputPassword.snp.makeConstraints { (make) in
            make.top.equalTo(errorEmail.snp.bottom).offset(10.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
        }
    }

    private func setupErrorPassword() {
        contentView.addSubview(errorPassword)

        errorEmail.font = .systemFont(ofSize: 16)
        errorPassword.textColor = .red
        errorPassword.snp.makeConstraints { (make) in
            make.top.equalTo(inputPassword.snp.bottom).offset(10.0)
            make.left.right.equalTo(inputPassword)
        }
    }

    private func setupActionSignUp() {
        contentView.addSubview(actionSignUp)

        actionSignUp.snp.makeConstraints { (make) in
            make.top.equalTo(errorPassword.snp.bottom).offset(20.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
            make.height.equalTo(50.0)
        }
    }

    private func setupActionLogin() {
        contentView.addSubview(actionLogin)

        actionLogin.snp.makeConstraints { (make) in
            make.top.equalTo(actionSignUp.snp.bottom).offset(10.0)
            make.centerX.equalTo(contentView)
            make.left.greaterThanOrEqualTo(contentView).offset(10.0)
            make.right.greaterThanOrEqualTo(contentView).offset(-10.0)
            make.height.equalTo(50.0)
        }
    }

    private func setupTextTerms() {
        contentView.addSubview(textTerms)

        textTerms.text = KString.displayTerms
        textTerms.isEditable = false
        textTerms.snp.makeConstraints { (make) in
            make.top.equalTo(actionLogin.snp.bottom).offset(10.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
            make.bottom.lessThanOrEqualTo(contentView).offset(-40.0)
            make.height.equalTo(100.0)
        }
    }

    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)

        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }
    }
}
