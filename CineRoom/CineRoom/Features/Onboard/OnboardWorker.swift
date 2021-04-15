//
//  OnboardWorker.swift
//  CineRoom
//
//  Created by Felipe Miranda on 14/04/21.
//

import Foundation
import FirebaseAuth

class OnboardWorker: WorkerDefault {
    
    private let handle = Auth.auth()
    
    func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool, _ errorCode: Int?) -> Void) {
        
        guard let _email = email, let _password = password else {
            return completion(false, nil)
        }
        
        handle.createUser(withEmail: _email, password: _password) { (authResult, error) in
            
            if error == nil {
                completion(true, nil)
                
            } else {
                let _error = error as NSError?
                completion(false, _error?.code)
            }
        }
    }
}
