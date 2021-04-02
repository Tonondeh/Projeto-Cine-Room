//
//  Extension+ViewController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 23/03/21.
//

import UIKit

fileprivate var aView: UIView?

extension UIViewController {
	
	func showSpinner() {
		aView = UIView(frame: self.view.bounds)
		aView?.backgroundColor = UIColor.lightGray
		
		let ai = UIActivityIndicatorView(style: .large)
		ai.center = aView!.center
		ai.startAnimating()
		aView?.addSubview(ai)
		self.view.addSubview(aView!)
	}
	
	func removeSpinner() {
		aView?.removeFromSuperview()
		aView = nil
	}
	
}
