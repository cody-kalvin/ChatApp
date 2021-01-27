//
//  File.swift
//  ChatApp
//
//  Created by Kalvin Dela Raga on 1/27/21.
//

import UIKit
import Firebase

class Janus {
    
    let window: UIWindow
    
    private var listener: AuthStateDidChangeListenerHandle?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        listener = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.gotoRoom()
            } else {
                self.gotoSignUp()
            }
        }
    }
    
    deinit {
        if let listener = listener {
            Auth.auth().removeStateDidChangeListener(listener)
        }
    }
}
