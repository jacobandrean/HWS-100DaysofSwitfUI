//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingActionSheet = false
    @State private var isShowingScanner = false
    let filter: FilterType
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter({ $0.isContacted })
        case .uncontacted:
            return prospects.people.filter({ !$0.isContacted })
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        if prospect.isContacted {
                            Image(systemName: "checkmark.circle")
                        }
                    }
                    .contextMenu(menuItems: {
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted") {
                            self.prospects.toggle(prospect)
                        }
                        
                        if !prospect.isContacted {
                            Button("Remind Me") {
                                self.addNotification(for: prospect)
                            }
                        }
                    })
                }
            }
            .navigationBarTitle(title)
            .navigationBarItems(
                leading:
                    Button("Sort by") {
                        isShowingActionSheet = true
                    },
                trailing:
                    Button(action: {
//                        let prospect = Prospect()
//                        prospect.name = "Jacob Andrean"
//                        prospect.emailAddress = "jacob.andrean@icloud.com"
//                        self.prospects.people.append(prospect)
                        self.isShowingScanner = true
                    }) {
                        Image(systemName: "qrcode.viewfinder")
                        Text("Scan")
                    }
            )
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Jacob Andrean\njacob.andrean@icloud.com", completion: self.handleScan)
            }
            .actionSheet(isPresented: $isShowingActionSheet, content: {
                ActionSheet(title: Text("Sort by"), message: Text("Sorting with"), buttons: [
                    .default(Text("Name"), action: {
                        self.prospects.sortBy(sortType: .name)
                    }),
                    .default(Text("Recent"), action: {
                        self.prospects.sortBy(sortType: .recent)
                    })
                ])
            })
        }
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
//            self.prospects.people.append(person)
//            self.prospects.save()
            self.prospects.add(person)
        case .failure(let error):
            print("Scanning failed: \(error)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = "Contact \(prospect.emailAddress)"
            content.sound = UNNotificationSound.default
            
//            var dateComponents = DateComponents()
//            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print(error)
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
