//
//  ViewController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/12/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import UIKit

class ListController: UITableViewController {

	static let notification = "LoginComplete"
	
	@IBOutlet weak var listView: UITableView!
	
	var listItems = [AnyObject]()
	var webView: UIWebView!

	
	//lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//add notification
		NotificationCenter.default.addObserver(self, selector: Selector(("finishLogin:")), name: NSNotification.Name(rawValue: ListController.notification), object: nil)
		
		//create and add webview
		webView = UIWebView()
		webView.frame = UIScreen.main.bounds
		self.view.addSubview(webView)
		
		let authorizationURL = URL(string: "https://ssl.reddit.com/api/v1/authorize?client_id=\(Constants.clientId)&response_type=code&state=TEST&redirect_uri=\(Constants.redirectUri)&duration=permanent&scope=read")
		let request = URLRequest(url: authorizationURL!)
		self.webView.loadRequest(request)

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	//actions
	func finishLogin(notification: NSNotification) {
		
		let url = notification.object as! NSURL
		let queryParams: [Any] = url.query!.components(separatedBy: "&")
		let codeParam: [Any] = queryParams.filter { NSPredicate(format: "SELF BEGINSWITH %@", "code=").evaluate(with: $0) }
		let codeQuery: String = codeParam[0] as! String
		let code: String = codeQuery.replacingOccurrences(of: "code=", with: "")
		print("My code is \(code)")
		
		self.webView!.removeFromSuperview()
	}
	
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

