//
//  Extension+TextField.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 11/03/21.
//

import Foundation
import UIKit


extension UITextField {
	
	func validateEmail() -> Bool {
		let email = self.text ?? ""
		
		if email == "" {
			return false
		}
		
		let emailComponents = email.components(separatedBy: "@")
		
		if emailComponents.count != 2 {
			return false
			
		} else {
			
			var dadosOK: Bool = true
			for comp in emailComponents {
				if comp == "" {
					dadosOK = false
					break
				} else {
					dadosOK = true
				}
			}
			
			return dadosOK
			
		}
	
	}
	
	func validateName() -> Bool {
		let name = self.text ?? ""
		
		if name == "" {
			return false
		}
		
		if name.count < 3 {
			return false
		} else {
			return true
		}
		
	}
	
	func validatePassword() -> Bool {
		let password = self.text ?? ""
		
		if password == "" {
			return false
		}
		
		if password.count < 6 {
			return false
		} else {
			return true
		}
		
	}
    
    func validateCPF() -> Bool {
        return false
    }
	
    func inputToBar()-> UIToolbar {
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .blue
        toolbar.backgroundColor = .white
        toolbar.sizeToFit()
        
        let buttonOK = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(finish))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceButton, buttonOK], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
        
    }
    
    @objc
    func finish() {
        self.resignFirstResponder()
    }
}

// pintar em vermelho, ou colocar no label o que falta.
