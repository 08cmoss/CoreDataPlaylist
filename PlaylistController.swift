//
//  PlaylistController.swift
//  CoreDataPlaylist
//
//  Created by Cameron Moss on 2/15/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedController = PlaylistController()
    
    var myPlaylists: [Playlist]? {
        
        let request = NSFetchRequest(entityName: "Playlist")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return try? moc.executeFetchRequest(request) as! [Playlist]
        
//        do {
//            return try moc.executeFetchRequest(request) as! [Playlist]
//        } catch {
//            return []
//        }
    }
    
    //create playlist
    func createPlaylist(name:String) {
        
      let _ = Playlist(name: name)
        saveToPersistentStore()
        
    }
    
    //remove playlist
    func removePlaylist(playlist: Playlist) -> () {
        if let moc = playlist.managedObjectContext {
            moc.deleteObject(playlist)
            saveToPersistentStore()
        }
    }
    
    //saves core data
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        //let _ = try? moc.save()
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
    
    //MARK: - Songs
    
    //Create Songs
    func createSong(title: String, artist: String, playlist: Playlist) {
        
        let _ = Song(title: title, artist: artist, playlist: playlist)
        saveToPersistentStore()
    }
    
    //Remove songs
    func removeSong(song: Song) {
        if let moc = song.managedObjectContext {
            moc.deleteObject(song)
            saveToPersistentStore()
        }
    }
    
    
}
