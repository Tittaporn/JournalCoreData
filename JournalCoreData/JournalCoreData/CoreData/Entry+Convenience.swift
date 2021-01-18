//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Lee McCormick on 1/18/21.
//

import CoreData

extension Entry {
    
    @discardableResult convenience init(title: String, bodytext: String, timestamp: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodytext = bodytext
        self.timestamp = timestamp
    }
}

extension Entry {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        lhs.timestamp == rhs.timestamp
    }
}


