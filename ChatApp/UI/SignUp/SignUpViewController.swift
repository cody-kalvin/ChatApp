//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/26/21.
//

import UIKit

protocol SignUpViewControllerDelegate: class {

    func signUpViewControllerHasSuccessfulSignUp(_ viewController: SignUpViewController)

    func signUpViewControllerDidTapLogin(_ viewController: SignUpViewController)
}

class SignUpViewController: UIViewController {

    lazy var scrollView = UIScrollView()

    lazy var contentView = UIView()

    lazy var inputEmail = DefaultTextField()

    lazy var errorEmail = UILabel()

    lazy var inputPassword = DefaultTextField()

    lazy var errorPassword = UILabel()

    lazy var actionSignUp = PrimaryButton(title: KString.actionSignUp)

    lazy var actionLogin = SecondaryButton(title: KString.actionLogin)

    lazy var textTerms = UITextView()

    lazy var activityIndicator = UIActivityIndicatorView()

    var viewModel: SignUpViewModel

    weak var delegate: SignUpViewControllerDelegate?

    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        setupSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        setupInteractions()
    }
}
