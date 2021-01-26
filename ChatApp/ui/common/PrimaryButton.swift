//
//  DefaultButton.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/26/21.
//

import UIKit

class PrimaryButton: UIButton {
    
    private var title: String = ""
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupLayout()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        backgroundColor = .blue
        tintColor = .white
        layer.cornerRadius = 8.0
    }
    
    func setEnabled(_ flag: Bool) {
        isEnabled = flag
        
        if isEnabled {
            setupLayout()
        }
    }
}
