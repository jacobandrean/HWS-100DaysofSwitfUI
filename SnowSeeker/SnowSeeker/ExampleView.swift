//
//  ExampleView.swift
//  SnowSeeker
//
//  Created by Jacob Andrean on 08/09/21.
//

import SwiftUI

//MARK: -
struct SplitViewExample: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: Text("New secondary"),
                label: {
                    Text("Hello")
                })
                .navigationBarTitle("Primary")
            
            Text("Secondary")
        }
    }
}


//MARK: -
struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertSheetOptional: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingAlert = false
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                self.selectedUser = User()
                self.isShowingAlert = true
            }
            .alert(item: $selectedUser) { user in
                Alert(title: Text(user.id))
            }
//            .alert(isPresented: $isShowingAlert, content: {
//                Alert(title: Text(selectedUser!.id))
//            })
    }
}


//MARK:-
struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Jacob")
            Text("Country: Indonesia")
            Text("Pets: Browny")
        }
    }
}
struct GroupAsTransparentLayout: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
//                VStack {
//                    UserView()
//                }
            } else {
                HStack(content: UserView.init)
//                HStack {
//                    UserView()
//                }
            }
        }
    }
}
