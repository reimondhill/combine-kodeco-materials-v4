///
/// Copyright (c) 2023 Kodeco Inc.
///
///
import SwiftUI

@main
struct CollageNeueApp: App {
	var body: some Scene {
		WindowGroup {
			MainView().environmentObject(CollageNeueModel())
		}
	}
}
