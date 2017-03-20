//
//  FullImageViewController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/18/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import Foundation
import UIKit

class FullImageViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	
	var imageUrl: String = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		loadImage()
	}
	
	func loadImage() {
		let mySession = URLSession.shared
		let imgURL: NSURL = NSURL(string: imageUrl)!
		let networkTask = mySession.dataTask(with: imgURL as URL, completionHandler: {data, response, error -> Void in
			if error == nil {
				self.imageView!.image = UIImage(data: data!)
			}
		})
		networkTask.resume()
	}
}
