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
	
}
