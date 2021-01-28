//
//  SignUpResult.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import Foundation

enum RequestState<T> {
    case initial
    case loading
    case success(result: T)
    case error(message: String)
}
