//
//  LogActivityView.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import SwiftUI

struct LogActivityView: View {
	@ObservedObject var activityLog: ActivityLog
	
    var body: some View {
		VStack {
			HStack {
				Text("Log")
				Spacer()
			}
			List {
				ForEach(activityLog.items) {
					ActivityItemView(item: $0)
				}
			}
		}
		.padding()
	}
}

struct ActivityItemView: View {
	let item: ActivityItem

	var body: some View {
		HStack {
			item.type.image()
			Text(item.timestamp.description + " - " + item.message)
		}
	}
}
