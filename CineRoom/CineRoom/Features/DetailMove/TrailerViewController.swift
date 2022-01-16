//
//  TrailerViewController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 29/03/21.
//

import UIKit
import youtube_ios_player_helper

class TrailerViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var playerView: YTPlayerView!
	
	
	// MARK: - Variable
	var videoKey: String?
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		preparePlayer()
	}
	
	
	// MARK: - Function
	private func preparePlayer() {
		if let _videoKey = videoKey {
			self.playerView.load(withVideoId: _videoKey)
		}
	}
	
}
