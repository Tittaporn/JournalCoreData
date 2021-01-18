//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Lee McCormick on 1/18/21.
//

import CoreData

class EntryController {
    // MARK: - Properties
    // Shared Instance
    static let shared = EntryController()
    
    //S.O.T
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - CRUD Methods
    // CREATE
    func createEntry(title: String, body: String) {
        Entry(title: title, bodytext: body, timestamp: Date())
        CoreDataStack.saveContext()
    }
    
    // READ
    func fetchEntries() {
        self.entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    // UPDATE
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodytext = body
        CoreDataStack.saveContext()
    }
    
    // DELETE
    func deleteEntry(entryToDelete: Entry) {
        guard let indexToDelete = entries.firstIndex(of: entryToDelete) else { return }
        entries.remove(at: indexToDelete)
        CoreDataStack.saveContext()
    }
    
}
