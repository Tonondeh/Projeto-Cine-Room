//
//  ForgetPassController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import UIKit

class ForgetPassController {
	
	func validateForgetPassword(newPass: UITextField, confNewPass: UITextField) -> Bool {
		if newPass.validatePassword() && confNewPass.validatePassword() && newPass.text == confNewPass.text {
			return true
		} else {
			return false
		}
	}
	
}
