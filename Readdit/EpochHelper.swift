//
//  EpochHelper.swift
//  Readdit
//
//  Created by Clinton VanSciver on 3/17/17.
//  Copyright © 2017 Clinton VanSciver. All rights reserved.
//

import Foundation

typealias UnixTime = Int

extension UnixTime {
	private func formatType(form: String) -> DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_US")
		dateFormatter.dateFormat = form
		return dateFormatter
	}
	var date: Date {
		return Date(timeIntervalSince1970: Double(self))
	}
}
