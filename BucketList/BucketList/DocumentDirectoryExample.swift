//
//  DocumentDirectoryExample.swift
//  BucketList
//
//  Created by Jacob Andrean on 15/08/21.
//

import SwiftUI

struct DocumentDirectoryExample: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    var body: some View {
        Text("Placeholder")
            .onTapGesture {
                let str = "Test MEssage"
//                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
//
//                do {
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    let input = try String(contentsOf: url)
//                    print(input)
//                } catch {
//                    print(error)
//                }
                FileManager.default.writeToDirectory(str: str)
            }
    }
}

struct DocumentDirectoryExample_Previews: PreviewProvider {
    static var previews: some View {
        DocumentDirectoryExample()
    }
}

extension FileManager {
    func getDocumentDirectory() -> URL {
        let paths = Self.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func writeToDirectory(str: String) {
        let url = getDocumentDirectory().appendingPathComponent("\(str).txt")
        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            print(input)
        } catch {
            print(error)
        }
    }
}
