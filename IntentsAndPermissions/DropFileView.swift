//
//  DropFileView.swift
//  IntentsAndPermissions
//
//  Created by Dan Waltin on 2022-07-05.
//

import SwiftUI
import Foundation
import AVFoundation

struct DropFileView: View {
	@State var dropTrackAccepted = false
	
	let importer: Importer
	
    var body: some View {
        Text("Drop a file here!")
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.padding()
			.border(borderColor, width: borderWidth)
			.padding()
			.onDrop(of: [UTType.fileURL], isTargeted: $dropTrackAccepted) { providers in
				Task {
					let urls = try await providers.urls()
					try importer.importFiles(urls)
				}
				return true
			}
    }
	
	private var borderColor: Color {dropTrackAccepted ? .accentColor : .secondary}
	private var borderWidth: CGFloat {dropTrackAccepted ? 2 : 1}

}

extension Array where Element == NSItemProvider {
	func urls() async throws -> [URL] {
		var urls = [URL]()
		
		for provider in self {
			let item = try await provider.loadItem(forTypeIdentifier: UTType.fileURL.identifier, options: nil)
			if let url = url(item) {
				urls.append(url)
			}
		}

		return urls
	}

	private func url(_ item: NSSecureCoding?) -> URL? {
		guard let data = item as? Data, let url = URL(dataRepresentation: data, relativeTo: nil) else {
			return nil
		}
				
		return url
	}

}

