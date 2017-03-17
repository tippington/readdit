//
//  ViewController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/12/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//
import Foundation
import UIKit

class ListController: UITableViewController {
	
	@IBOutlet weak var listView: UITableView!
	
	var listItems = [PostObject]()
	var webView: UIWebView!
	
	var selectedPost: PostObject?

	
	//lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		listView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "postCell")
		
		fetchPosts()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "postViewSegue" {
			//set destination view controller selectedPost to self.selectedPost
			let destVc = segue.destination as! PostViewController
			destVc.selectedPost = self.selectedPost
		}
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
					
						if (i == data.count - 1) {
							self.listView!.reloadData()
						}
					}
				})
			} catch {
				print(error.localizedDescription)
			}
		})
		networkTask.resume()
	}
	
	func loadImage(urlString: String, frame: UIImageView) {
		let mySession = URLSession.shared
		let imgURL: NSURL = NSURL(string: urlString)!
		let networkTask = mySession.dataTask(with: imgURL as URL, completionHandler: {data, response, error -> Void in
			if error == nil {
					frame.image = UIImage(data: data!)
				}
		})
		networkTask.resume()
	}
	
	//delegate methods
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCellController
		let post = listItems[indexPath.row]
		
		cell.titleLabel!.text = post.title!
		cell.authorLabel!.text = post.author!
		cell.subredditLabel!.text = post.sub!
		cell.scoreLabel!.text = "\(post.score!)"
		
		let unix = post.createdAtUTC! as UnixTime
		let dateFormatter = DateFormatter()
		let since = dateFormatter.timeSince(from: unix.date, numericDates: false)
		
		cell.createdAtLabel!.text = since
		
		loadImage(urlString: post.thumbUrl!, frame: cell.thumbnail)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedPost = listItems[indexPath.row]
		self.performSegue(withIdentifier: "postViewSegue", sender: nil)
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listItems.count
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	
	
}

