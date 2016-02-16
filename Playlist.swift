//
//  Playlist.swift
//  CoreDataPlaylist
//
//  Created by Cameron Moss on 2/15/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation
import CoreData


class Playlist: NSManagedObject {

    convenience init(name: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Playlist", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        
        }
}
