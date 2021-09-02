//
//  EnvironmentObjectExample.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentObjectExample: View {
    let user = User()
    
    var body: some View {
//        VStack {
//            EditView().environmentObject(user)
//            DisplayView().environmentObject(user)
//        }
        
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}
