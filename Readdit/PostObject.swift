//
//  PostObject.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/13/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import Foundation

struct PostObject {
	
	var createdAtUTC: Int?
	var countComments: Int?
	var nsfw: Bool?
	var preview: Bool?
	var sub: String?
	var title: String?
	var score: Int?
	var type: String?
	var url: String?
	var thumbUrl: String?
	
	init(with: [String:AnyObject]) {
		createdAtUTC = 0
		countComments = 0
		nsfw = false
		preview = false
		sub = ""
		title = ""
		score = 0
		type = ""
		url = ""
		thumbUrl = ""
		
		if let c_utc = with["created_utc"] as? Int {
			createdAtUTC = c_utc
		}
		if let c_comments = with["num_comments"] as? Int {
			countComments = c_comments
		}
		if let over_18 = with["over_18"] as? Int {
			if over_18 == 1 {
				nsfw = true
			}
		}
		if let show_preview = with["preview"]?["enabled"] as? Int {
			if show_preview == 1 {
				preview = true
			}
		}
		if let subr = with["subreddit"] as? String {
			sub = subr
		}
		if let mTitle = with["title"] as? String {
			title = mTitle
		}
		if let mScore = with["score"] as? Int {
			score = mScore
		}
		if let mType = with["post_hint"] as? String {
			type = mType
		}
		if let mUrl = with["url"] as? String {
			url = mUrl
		}
		if let thumb = with["thumbnail"] as? String {
			thumbUrl = thumb
		}
	}
}
