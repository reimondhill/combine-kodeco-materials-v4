///
/// Copyright (c) 2023 Kodeco Inc.
///

import Foundation
import Photos
import Combine

extension PHPhotoLibrary {
	static var isAuthorized: Future<Bool, Never> {
		Future { resolve in
			Self.fetchAuthorizationStatus { status in
				resolve(.success(status))
			}
		}
	}

	static func fetchAuthorizationStatus(callback: @escaping (Bool) -> Void) {
		// Fetch the current status.
		let currentlyAuthorized = authorizationStatus() == .authorized

		// If authozied callback immediately.
		guard !currentlyAuthorized else {
			return callback(currentlyAuthorized)
		}
		
		// Otherwise request access and callback with the new status.
		requestAuthorization { newStatus in
			callback(newStatus == .authorized)
		}
	}
}

