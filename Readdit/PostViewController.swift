//
//  PostViewController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/14/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import Foundation
import UIKit

class PostViewController: UIViewController {
	
	var selectedPost: PostObject?
	
	@IBOutlet weak var webView: UIWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if selectedPost != nil {
			initUI()
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func initUI() {
		webView.loadRequest(URLRequest(url: URL(string: (selectedPost?.url)!)!))
	}
	
}
