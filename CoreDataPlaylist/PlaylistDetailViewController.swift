//
//  PlaylistDetailViewController.swift
//  CoreDataPlaylist
//
//  Created by Cameron Moss on 2/15/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViewWithPlaylistDetails(self.playlist!)
       
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        if let playlist = playlist, let title = titleText.text, let artist = artistText.text {
            PlaylistController.sharedController.createSong(title, artist: artist, playlist: playlist)
            titleText.text = ""
            artistText.text = ""
            tableView.reloadData()
        }
        
        
    }
    
    func updateViewWithPlaylistDetails(playlist: Playlist) {
        title = playlist.name
    }

    

    

    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
    

}

extension PlaylistDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
        
        //One to many relationships casuses songs to be saved in a set
        if let songSet = playlist?.songs {
            let songs = Array(songSet) as! [Song]
            let song = songs[indexPath.row]
            
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let songSet = playlist?.songs {
            let songs = Array(songSet) as! [Song]
            return songs.count
        } else {
            return 0
        }
    }
   
    
    
}
