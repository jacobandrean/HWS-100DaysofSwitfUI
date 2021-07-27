//
//  SwiftUIView.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//

import SwiftUI

struct EnsureNonDuplicateDataExample: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try self.moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct EnsureNonDuplicateDataExample_Previews: PreviewProvider {
    static var previews: some View {
        EnsureNonDuplicateDataExample()
    }
}
