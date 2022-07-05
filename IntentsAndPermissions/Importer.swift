//
//  Importer.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import Foundation

class Importer {
	private let activityLog: ActivityLog
	
	init(activityLog: ActivityLog) {
		self.activityLog = activityLog
	}
	
	func importFiles(_ urls: [URL]) throws {
		activityLog.logInfo("importing \(urls.count) file(-s)")
		
		do {
			for url in urls {
				let _ = try Data(contentsOf: url)
			}
			activityLog.logInfo("content of files read successfully")
		} catch {
			activityLog.logError("failed to read content of files", error: error)
		}
	}
}
