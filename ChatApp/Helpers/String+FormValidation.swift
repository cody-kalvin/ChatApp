//
//  String+FormValidation.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import Foundation

extension String {

    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        return (8...16).contains(self.count)
    }
}
