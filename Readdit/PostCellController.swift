//
//  PostCellController.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/14/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import Foundation
import UIKit

class PostCellController: UITableViewCell {
		
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subredditLabel: UILabel!
	@IBOutlet weak var authorLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var createdAtLabel: UILabel!
	@IBOutlet weak var thumbnail: UIImageView!
	
	var row: Int!
	
	@IBAction func thumbnailBtnPressed(_ sender: AnyObject?) {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: ListController.thumbNotification), object: row)
	}
	
}
