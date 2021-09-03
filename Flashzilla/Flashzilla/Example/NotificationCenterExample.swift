//
//  NotificationCenterExample.swift
//  Flashzilla
//
//  Created by Jacob Andrean on 03/09/21.
//

import SwiftUI

struct NotificationCenterExample: View {
    
    var body: some View {
        Text("Hello, world!")
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                print("Moving to the background!")
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                print("Moving to the foreground!")
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification), perform: { _ in
                print("User took a screenshot!")
            })
    }
}
