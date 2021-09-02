//
//  AddNewPersonView.swift
//  RememberMe
//
//  Created by Jacob Andrean on 02/09/21.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingImagePicker = false
    @State private var uiImage: UIImage?
    @State private var name = ""
    @Binding var people: [Person]
    
    var body: some View {
        VStack {
            Image(uiImage: uiImage != nil ? uiImage! : UIImage(systemName: "person")!)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .onTapGesture {
                    showingImagePicker = true
                }
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 100, alignment: .center)
            
            Button("Add person") {
                addPerson()
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(uiImage: $uiImage)
        }
        .onAppear {
            showingImagePicker = true
        }
    }
    
    func addPerson() {
        people.append(Person(name: name, imageData: uiImage?.jpegData(compressionQuality: 0.8) ?? Data()))
        people = people.sorted()
        saveDate()
        presentationMode.wrappedValue.dismiss()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveDate() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPeople")
            let data = try JSONEncoder().encode(people)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        }
        catch {
            print("Unable to save data with Error: \(error)")
        }
    }
}
