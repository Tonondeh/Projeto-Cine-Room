//
//  LoginWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import FirebaseAuth

class LoginWorker {
	
	private let handle = Auth.auth()
	
	
	func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		guard let _email = email, let _password = password else {
			return completion(false)
		}
		
		handle.createUser(withEmail: _email, password: _password) { (authResult, error) in
			
			if error != nil {
				completion(false)
			}
			
			if authResult == nil {
				completion(false)
			} else {
				completion(true)
			}
			
		}
		
	}
	
	func signInCredential(credential: AuthCredential, completion: @escaping(_ success: Bool) -> Void) {
		
		handle.signIn(with: credential) { (authResult, error) in
			if error != nil {
				completion(false)
			} else {
				
				if authResult == nil {
					completion(false)
				} else {
					completion(true)
				}
				
			}
		}
		
	}
	
	func signIn(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		guard let _email = email, let _password = password else {
			return completion(false)
		}
		
		handle.signIn(withEmail: _email, password: _password) { (authResult, error) in
			if error != nil {
				completion(false)
			} else {
				
				if authResult == nil {
					completion(false)
				} else {
					completion(true)
				}
				
			}
		}
		
	}
	
	func addStateDidChangeListener(completion: @escaping(_ success: String?) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		handle.addStateDidChangeListener { (auth, user) in
			if user == nil {
				completion(nil)
			} else {
				completion(user?.email)
			}
		}
	}
	
	func removeStateDidChangeListener() {
		Auth.auth().removeStateDidChangeListener(handle)
	}
	
}
