//
//  ContentView.swift
//  RememberMe
//
//  Created by Jacob Andrean on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddNewPersonView = false
    @State private var uiImage: UIImage?
    @State private var people = [Person]()
    
    var body: some View {
        NavigationView {
            List(people, id: \.self) { person in
                NavigationLink(
                    destination: PersonFullImageView(image: image(from: person.imageData), name: person.name, location: person.location),
                    label: {
                        HStack {
                            image(from: person.imageData)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text(person.name)
                        }
                    })
            }
            .sheet(isPresented: $showingAddNewPersonView) {
                AddNewPersonView(people: $people)
            }
            .navigationBarTitle("RememberMe")
            .navigationBarItems(
                trailing:
                    Button("Add new person") {
                        showingAddNewPersonView = true
                    }
            )
            .onAppear(perform: loadData)
        }
    }
    
    func image(from data: Data) -> Image {
        guard let uiImage = UIImage(data: data) else { return Image(systemName: "person")}
        let image = Image(uiImage: uiImage)
        return image
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPeople")
        do {
            let data = try Data(contentsOf: filename)
            people = try JSONDecoder().decode([Person].self, from: data).sorted()
        }
        catch {
            print("Unable to load data with Error: \(error)")
        }
    }
}

struct PersonFullImageView: View {
    let image: Image
    let name: String
    let location: Location?
    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
            Text("\(location?.latitude ?? 0) \(location?.longitude ?? 0)")
            image
                .resizable()
                .scaledToFit()
        }
    }
}
