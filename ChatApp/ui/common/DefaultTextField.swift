//
//  DefaultTextField.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/26/21.
//

import UIKit

class DefaultTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 12.0, left: 8.0, bottom: 12.0, right: 8.0)
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        autocapitalizationType = .none
        backgroundColor = nil
        borderStyle = .roundedRect
        layer.cornerRadius = 8.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds.inset(by: padding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds.inset(by: padding))
    }
}
