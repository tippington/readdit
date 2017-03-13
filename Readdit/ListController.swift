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
	
	var listItems = [PostObject]()
	var webView: UIWebView!

	
	//lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fetchPosts()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	//actions
	func fetchPosts() {
		let mySession = URLSession.shared
		let url: NSURL = NSURL(string: Constants.url)!
		let networkTask = mySession.dataTask(with: url as URL, completionHandler: {data, response, error -> Void in
			do {
				let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject]
				let data = json["data"]!["children"]! as! [AnyObject]
				DispatchQueue.main.async(execute: {
					for i in 0..<data.count {
						let item = (data[i] as! [String:AnyObject])["data"]!
						let post = PostObject(with: item as! [String:AnyObject])
						self.listItems.append(post)
						
						if (i == 0) {
							print(item)
						}
						
						self.listView!.reloadData()
					}
				})
			} catch {
				print(error.localizedDescription)
			}
		})
		networkTask.resume()
	}
	
	//delegate methods
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let post = listItems[indexPath.row]
		cell.textLabel!.text = post.title
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		
		return 30
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listItems.count
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	
	
}

