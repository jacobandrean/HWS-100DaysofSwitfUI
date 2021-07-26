//
//  ContentView.swift
//  HabitTracking
//
//  Created by Jacob Andrean on 26/07/21.
//

import SwiftUI

struct Habit: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    var completionCount: Int
    
    mutating public func increaseCompletionCount() {
        self.completionCount += 1
    }

    mutating public func decreaseCompletionCount() {
        self.completionCount -= 1
    }
}

class HabitViewModel: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "HabitItems")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "HabitItems") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
}

struct HabitTrackingView: View {
    @ObservedObject var habitViewModel = HabitViewModel()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<habitViewModel.items.count, id: \.self) { index in
                    NavigationLink(
                        destination:
                            DetailView(habit: $habitViewModel.items[index], index: index)
                    ) {
                        ListItemView(habit: habitViewModel.items[index])
                    }
                }
                .onDelete(perform: { indexSet in
                    habitViewModel.items.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Habit Tracking")
            .navigationBarItems(
                trailing:
                    Button("Add Activity") {
                        showAddActivity.toggle()
                    }
            )
            .sheet(isPresented: $showAddActivity, content: {
                AddNewActivityView(activities: habitViewModel)
            })
        }
    }
}

struct ListItemView: View {
    let habit: Habit
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.title)
            Text(habit.description)
        }
    }
}

struct DetailView: View {
    @Binding var habit: Habit
    let index: Int
    var body: some View {
        Form {
            Text("Description: \n\(habit.description)")
            Stepper("\(habit.completionCount)", onIncrement: {
                habit.increaseCompletionCount()
            }, onDecrement: {
                habit.decreaseCompletionCount()
            })
        }
        .navigationBarTitle(habit.title, displayMode: .inline)
    }
    
}

struct AddNewActivityView: View {
    @ObservedObject var activities: HabitViewModel
    @Environment (\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Activity")
            .navigationBarItems(
                trailing:
                    Button("Add") {
                        let item = Habit(title: title, description: description, completionCount: 0)
                        activities.items.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitTrackingView()
    }
}

extension Sequence {
    func indexed() -> Array<Any> {
        return Array(enumerated())
    }
}
