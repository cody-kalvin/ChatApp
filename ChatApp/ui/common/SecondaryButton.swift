//
//  SecondaryButton.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/26/21.
//

import UIKit

class SecondaryButton: UIButton {
    
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
        backgroundColor = .white
        
        layer.borderWidth = 0.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16.0),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedString = NSMutableAttributedString(string: title, attributes: attributes)
        setAttributedTitle(attributedString, for: .normal)
    }
}
