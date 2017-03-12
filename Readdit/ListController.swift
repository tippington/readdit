//
//  ViewController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/12/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import UIKit

class ListController: UITableViewController {

	@IBOutlet weak var listView: UITableView!
	
	var listItems = [AnyObject]()
	
	//lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		var authorizationURL = URL(string: "https://ssl.reddit.com/api/v1/authorize?client_id=\(Constants.clientId)&response_type=code&state=TEST&redirect_uri=Readdit://response&duration=permanent&scope=read")
		var request = URLRequest(url: authorizationURL!)
//		self.webView.loadRequest(request)

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	//actions
	
	//delegate methods
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 30
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 50
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	//datasource methods
	
	
}

