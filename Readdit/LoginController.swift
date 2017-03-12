//
//  LoginController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/12/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import UIKit
import SafariServices

class LoginController: UIViewController, SFSafariViewControllerDelegate {
	
	static let kNotification = "CloseSafariReddit"
	
	var safariController:SFSafariViewController?
	
	@IBOutlet weak var txtUsername: UITextField!
	@IBOutlet weak var txtPassword: UITextField!
	
	override func viewDidLoad() {
		NotificationCenter.default.addObserver(self, selector: Selector(("finishLogin:")), name: NSNotification.Name(rawValue: LoginController.kNotification), object: nil)
	}
	
	@IBAction func doLogin(sender: UIButton) {
		let url = "https://ssl.reddit.com/api/v1/authorize?client_id=\(Constants.clientId)&response_type=code&state=TEST&redirect_uri=\(Constants.redirectUri)&duration=permanent&scope=read"
		let sfUrl = NSURL(string: url)
		safariController = SFSafariViewController(url: sfUrl! as URL)
		safariController!.delegate = self
		self.present(safariController!, animated: true, completion: nil)
	}
	
	func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
		controller.dismiss(animated: true, completion: nil)
	}
	
	func finishLogin(notification: NSNotification) {
		let url = notification.object as! NSURL
		NSLog(url.query!)
		let codePart = url.query?.components(separatedBy: "&").filter({ (part) -> Bool in
			return part.hasPrefix("code=")
		})
		let code = codePart![0].components(separatedBy: "=")[1]
		NSLog("code is \(code)")
		safariController?.dismiss(animated: true, completion: nil)
		self.performSegue(withIdentifier: "gotoList", sender: nil)
	}
}
