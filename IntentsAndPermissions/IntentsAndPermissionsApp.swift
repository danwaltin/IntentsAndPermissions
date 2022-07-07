//
//  IntentsAndPermissionsApp.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import SwiftUI

let globalActivityLog = ActivityLog()

@main
struct IntentsAndPermissionsApp: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

	var body: some Scene {
		
        WindowGroup {
            ContentView()
				.frame(minWidth: 400, minHeight: 300)
				.environmentObject(globalActivityLog)
		}
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
}
