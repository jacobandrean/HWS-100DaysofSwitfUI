//
//  ContentView.swift
//  Moonshot
//
//  Created by Jacob Andrean on 22/07/21.
//

import SwiftUI


struct NavLinkView: View {
    @Binding var showLaunchDate: Bool
    let mission: Mission
    
    var crew: String {
        return mission.crew.map({ $0.name }).joined(separator: ", ")
    }
    
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                if showLaunchDate {
                    Text(mission.formattedLaunchDate)
                } else {
                    Text(crew)
                }
            }
        }
    }
}

struct MoonshotView: View {
    @State private var showLaunchDate = true
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(
                    destination: MissionView(mission: mission, astronauts: self.astronauts)
                ) {
                    NavLinkView(showLaunchDate: $showLaunchDate, mission: mission)
                }
                
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(showLaunchDate ? "LaunchDate" : "Crew") {
                    showLaunchDate.toggle()
                }
            )
        }
    }
}

struct MoonshotView_Previews: PreviewProvider {
    static var previews: some View {
        MoonshotView()
    }
}
