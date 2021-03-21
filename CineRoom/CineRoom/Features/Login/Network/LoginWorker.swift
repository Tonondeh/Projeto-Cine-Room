//
//  LoginWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import FirebaseAuth

class LoginWorker {
	
	
	func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		guard let _email = email, let _password = password else {
			return completion(false)
		}
		
		Auth.auth().createUser(withEmail: _email, password: _password) { (authResult, error) in
			
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
	
}
