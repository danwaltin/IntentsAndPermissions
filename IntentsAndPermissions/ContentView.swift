//
//  ContentView.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var activityLog: ActivityLog
	
    var body: some View {
		VStack {
			DropFileView(importer: Importer(activityLog: activityLog))
			LogActivityView(activityLog: activityLog)
		}
    }
}
