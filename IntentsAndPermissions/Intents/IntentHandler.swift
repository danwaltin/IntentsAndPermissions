//
//  IntentHandler.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import AppKit
import Foundation
import Intents

extension AppDelegate {
	func application(_ application: NSApplication, handlerFor intent: INIntent) -> Any? {
		if intent is ImportFileIntent {
			return ImportFileIntentHandler(activityLog: globalActivityLog)
		}
		
		return nil
	}
}

class ImportFileIntentHandler: NSObject, ImportFileIntentHandling {
	private let activityLog: ActivityLog

	init(activityLog: ActivityLog) {
		self.activityLog = activityLog
	}
	
	func handle(intent: ImportFileIntent) async -> ImportFileIntentResponse {
		guard let path = intent.path else {
			activityLog.logWarning("Intent could not import file. No path provided")
			return ImportFileIntentResponse(code: .failure, userActivity: nil)
		}

		let url = path.fileURL!

		activityLog.logInfo("Intent is importing file from at: \(path.filename)")


		do {

			url.startAccessingSecurityScopedResource()
			let _ = try Data(contentsOf: url)
			url.stopAccessingSecurityScopedResource()
			activityLog.logInfo("Intent has successfully read file data")
		} catch {
			activityLog.logError("Intent has failed to read file data", error: error)
			return ImportFileIntentResponse(code: .failure, userActivity: nil)
		}

		let response = ImportFileIntentResponse(code: .success, userActivity: nil)
		response.importedFile = ImportedFile(identifier: "qwerty", display: "An imported file")
		return response
	}
	
	func resolvePath(for intent: ImportFileIntent) async -> INFileResolutionResult {
		guard let path = intent.path else {
			return .needsValue()
		}

		return .success(with: path)
	}
}
