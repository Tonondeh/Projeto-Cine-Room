//
//  AssistirViewController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 29/03/21.
//

import UIKit
import WebKit

class AssistirViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var webView: WKWebView!
	
	
	// MARK: - Variable
	var urlHomePage: String?
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configWebView()
	}
	
	
	// MARK: - Function
	private func configWebView() {
		if let urlString = urlHomePage {
			print("URL Homepage: \(urlString)")
			guard let url = URL(string: urlString) else { return }
			let request = URLRequest(url: url)
			self.webView.load(request)
		}
	}
	
}
