//
//  ScheduleNotificationExample.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import UserNotifications
import SwiftUI

struct ScheduleNotificationExample: View {
    var body: some View {
        VStack {
            Button("Request permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All Set!")
                    }
                    else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the caat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ScheduleNotificationExample_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleNotificationExample()
    }
}
