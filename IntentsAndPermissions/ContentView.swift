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
			DropFileView(activityLog: activityLog)
			LogActivityView(activityLog: activityLog)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
