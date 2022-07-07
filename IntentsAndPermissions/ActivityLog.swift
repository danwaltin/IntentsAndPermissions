//
//  ActivityLog.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import Foundation
import SwiftUI

enum ActivityType {
	case info
	case warning
	case error

	func image() -> some View {
		switch self {
		case .info:
			return Image(systemName: "info.circle.fill").foregroundColor(.primary)
		case .warning:
			return Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.yellow)
		case .error:
			return Image(systemName: "xmark.octagon.fill").foregroundColor(.red)
		}
	}
}

struct ActivityItem: Identifiable {
	let id = UUID()
	
	let timestamp: Date
	let message: String
	let type: ActivityType
}

class ActivityLog: ObservableObject {
	@Published var items = [ActivityItem]()
	
	func logInfo(_ message: String) {
		log(message, type: .info)
	}

	func logWarning(_ message: String) {
		log(message, type: .warning)
	}

	func logError(_ message: String, error: Error) {
		let errorMessage = message + " - " + error.localizedDescription
		log(errorMessage, type: .error)
	}

	private func log(_ message: String, type: ActivityType) {
		let item = ActivityItem(timestamp: Date(), message: message, type: type)

		DispatchQueue.main.async { [self] in
			items.append(item)
		}
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
