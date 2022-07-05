//
//  ActivityLog.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import Foundation

struct ActivityItem: Identifiable {
	let id = UUID()
	
	let timestamp: Date
	let message: String
}

class ActivityLog: ObservableObject {
	@Published var items = [ActivityItem]()
	
	func logInfo(_ message: String) {
		items.append(.init(timestamp: Date(), message: message))
	}
	
	func logError(_ message: String, error: Error) {
		items.append(.init(timestamp: Date(), message: message))
	}
}

extension Date {
	func localizedDescription(dateStyle: DateFormatter.Style = .short,
							  timeStyle: DateFormatter.Style = .medium,
							  in timeZone: TimeZone = .current,
							  locale: Locale = .current) -> String {
		let f = DateFormatter()
		f.locale = locale
		f.timeZone = timeZone
		f.dateStyle = dateStyle
		f.timeStyle = timeStyle
		return f.string(from: self)
	}

	var debugDescription: String { localizedDescription(dateStyle: .none) }
}
