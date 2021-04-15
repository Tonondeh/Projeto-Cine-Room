//
//  Extension+ViewController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 23/03/21.
//

import UIKit
import Lottie

fileprivate var aView: UIView?
fileprivate var animationView: AnimationView?

extension UIViewController {
	
	func showSpinner() {
		aView = UIView(frame: self.view.bounds)
		aView?.backgroundColor = UIColor(named: "backgroundColor")
		
		animationView = AnimationView()
		animationView?.animation = Animation.named("movie-theatre")
		animationView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
		animationView?.center = view.center
		animationView?.contentMode = .scaleAspectFit
		animationView?.loopMode = .loop
		animationView?.animationSpeed = 2.0
		animationView?.play()
		
		aView?.addSubview(animationView ?? AnimationView())
		self.view.addSubview(aView ?? UIView())
	}
	
	func removeSpinner() {
		aView?.removeFromSuperview()
		aView = nil
		animationView?.stop()
	}
	
	func showAlertAnimation() {
		let someView = UIView()
		someView.backgroundColor = .red
        someView.frame = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.width, height: 0)
		view.addSubview(someView)
		
		UIView.animate(withDuration: 1, delay: 0, options: []) {
			someView.frame = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.width, height: -100)
			
			let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: someView.bounds.width, height: 80))
			textLabel.textAlignment = .center
			textLabel.font = UIFont.boldSystemFont(ofSize: 20)
			textLabel.text = "E-mail/senha inválido"
			
			someView.addSubview(textLabel)
			
		} completion: { (_) in
			Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
				UIView.animate(withDuration: 1) {
					someView.frame = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.width, height: 0)
				}
			}
		}
	}
	
}
