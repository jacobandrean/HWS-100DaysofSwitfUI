//
//  Prospect.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    fileprivate(set) var createdAt = Date()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    static let saveKey = "SavedData"
    
    @Published private(set) var people: [Prospect]
    
    init() {
//        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                self.people = decoded
//                return
//            }
//        }
//
//        self.people = []
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filename = paths[0].appendingPathComponent(Self.saveKey)
        do {
            let data = try Data(contentsOf: filename)
            let decoded = try JSONDecoder().decode([Prospect].self, from: data)
            self.people = decoded
        }
        catch {
            print(error)
            self.people = []
        }
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
//        save()
        saveToDocumentsDirectory()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
//        save()
        saveToDocumentsDirectory()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func saveToDocumentsDirectory() {
        let filename = getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        }
        catch {
            print(error)
        }
    }
    
    private func loadFromDocumentsDirectory(completion: (Result<[Prospect], Error>) -> Void) {
        let filename = getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
            let data = try Data(contentsOf: filename)
            let decoded = try JSONDecoder().decode([Prospect].self, from: data)
            completion(.success(decoded))
        }
        catch {
            print(error)
            completion(.failure(error))
        }
    }
    
    enum SortType {
        case name, recent
    }
    func sortBy(sortType: SortType) {
        switch sortType {
        case .name:
            self.people = self.people.sorted(by: {$0.name < $1.name})
        case .recent:
            self.people = self.people.sorted(by: {$0.createdAt > $1.createdAt})
        }
    }
}
