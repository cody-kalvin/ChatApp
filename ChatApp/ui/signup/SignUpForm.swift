//
//  SignUpForm.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/25/21.
//

import UIKit
import SnapKit

class SignUpForm: UIView {
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var contentView = UIView()
    
    private lazy var inputUsername = DefaultTextField()
    
    private lazy var errorUsername = UILabel()
    
    private lazy var inputPassword = DefaultTextField()
    
    private lazy var errorPassword = UILabel()
    
    private lazy var actionSignUp = PrimaryButton(title: BDString.actionSignUp)
    
    private lazy var actionLogin = SecondaryButton(title: BDString.actionLogin)
    
    private lazy var textTerms = UITextView()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        setupScrollView()
        setupContentView()
        setupInputUsername()
        setupErrorUsername()
        setupInputPassword()
        setupErrorPassword()
        setupActionSignUp()
        setupActionLogin()
        setupTextTerms()
    }
    
    private func setupScrollView() {
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.bottom.greaterThanOrEqualTo(self)
        }
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        
        contentView.backgroundColor = .white
        contentView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.width.height.top.bottom.equalTo(scrollView)
        }
    }
    
    private func setupInputUsername() {
        contentView.addSubview(inputUsername)
        
        inputUsername.placeholder = "Username"
        inputUsername.keyboardType = .default
        inputUsername.returnKeyType = .next
        inputUsername.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(40.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
        }
    }
    
    private func setupErrorUsername() {
        contentView.addSubview(errorUsername)
        
        errorUsername.font = .systemFont(ofSize: 16)
        errorUsername.textColor = .red
        errorUsername.snp.makeConstraints { (make) in
            make.top.equalTo(inputUsername.snp.bottom).offset(10.0)
            make.left.right.equalTo(inputUsername)
        }
    }
    
    private func setupInputPassword() {
        contentView.addSubview(inputPassword)
        
        inputPassword.placeholder = "Password"
        inputPassword.keyboardType = .default
        inputPassword.isSecureTextEntry = true
        inputPassword.returnKeyType = .done
        inputPassword.snp.makeConstraints { (make) in
            make.top.equalTo(errorUsername.snp.bottom).offset(10.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
        }
    }
    
    private func setupErrorPassword() {
        contentView.addSubview(errorPassword)
        
        errorUsername.font = .systemFont(ofSize: 16)
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
        
        textTerms.text = BDString.displayTerms
        textTerms.isEditable = false
        textTerms.snp.makeConstraints { (make) in
            make.top.equalTo(actionLogin.snp.bottom).offset(10.0)
            make.left.equalTo(contentView).offset(10.0)
            make.right.equalTo(contentView).offset(-10.0)
            make.bottom.lessThanOrEqualTo(contentView).offset(-40.0)
            make.height.equalTo(100.0)
        }
    }
}
