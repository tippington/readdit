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
	@IBOutlet weak var thumbnail: UIImageView!
	
	func noThumb() {
		titleLabel.frame = CGRect(x: titleLabel.frame.origin.x - 40, y: titleLabel.frame.origin.y, width: titleLabel.frame.size.width, height: titleLabel.frame.size.height)
	}
	
	
}
