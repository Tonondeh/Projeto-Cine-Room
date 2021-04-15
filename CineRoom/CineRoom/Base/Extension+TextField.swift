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
		
        if !CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: password)) {
            print("aceita somente sumeros")
            return false
        }
        
        if password.count < 6 {
            return false
        } else {
            return true
        }
        
       
		
	}
    	
    func inputToolbar()-> UIToolbar {
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
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.03
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 5.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 5.0, y: self.center.y)
        layer.add(animation, forKey: "position")
        
        let color = CABasicAnimation(keyPath: "borderColor")
        color.fromValue = UIColor.red.cgColor
        color.duration = 2
        color.repeatCount = 1
        
        layer.add(color, forKey: "borderColor")
      
        let border = CABasicAnimation(keyPath: "borderWidth")
        border.fromValue = 3
        border.toValue = 0
        border.duration = 2
        border.repeatCount = 1
        layer.add(border, forKey: "borderWidth")
    }
    
    
    @objc
    func finish() {
        self.resignFirstResponder()
    }
		
}
