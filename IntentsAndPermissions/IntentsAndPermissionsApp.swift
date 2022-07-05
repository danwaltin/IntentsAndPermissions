//
//  IntentsAndPermissionsApp.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import SwiftUI

@main
struct IntentsAndPermissionsApp: App {
	@StateObject var activityLog = ActivityLog()

	var body: some Scene {
		
        WindowGroup {
            ContentView()
				.frame(minWidth: 400, minHeight: 300)
				.environmentObject(activityLog)
		}
    }
}
