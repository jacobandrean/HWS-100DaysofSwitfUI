//
//  SwiftUIView.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//

import SwiftUI

struct MOCHasChangesExample: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct MOCHasChangesExample_Previews: PreviewProvider {
    static var previews: some View {
        MOCHasChangesExample()
    }
}
