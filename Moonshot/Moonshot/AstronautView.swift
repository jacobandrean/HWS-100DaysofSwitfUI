//
//  AstronautView.swift
//  Moonshot
//
//  Created by Jacob Andrean on 22/07/21.
//

import SwiftUI

struct AstronautView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronaut: Astronaut
    
    var astronautMissions: [Mission] {
        missions.filter { mission in
            mission.crew.contains(where: {$0.name == self.astronaut.id})
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .lineLimit(11000)
                        .padding()
                        .layoutPriority(1) // to fix SwiftUi bug
                    VStack(alignment: .leading) {
                        Text("Missions: ")
                        List(astronautMissions, id: \.id) {
                            Text("\($0.displayName)")
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[7])
    }
}
