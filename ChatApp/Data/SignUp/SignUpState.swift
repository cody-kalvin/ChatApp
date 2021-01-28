//
//  SignUpResult.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import Foundation

enum SignUpState {
    case initial
    case loading
    case success
    case error(message: String)
}
