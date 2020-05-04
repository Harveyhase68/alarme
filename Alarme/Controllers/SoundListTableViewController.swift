//
//  SoundListTableViewController.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-28.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit
import AVFoundation

class SoundListTableViewController: UITableViewController {
    
    var sounds: [Sound] = []
    var soundPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SoundTableViewCell", bundle: nil), forCellReuseIdentifier: "songCell")
        // Hide excess cells in tableView
        tableView.tableFooterView = UIView()
        
        populateSoundsArray()
    }
    
    func populateSoundsArray() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix(".mp3") {
                let songName = Sound(name: item)
                sounds.append(songName)
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sound = sounds[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SoundTableViewCell
        //cell.playButton.tag = indexPath.row
        cell.setSound(sound: sound)
        cell.delegate = self

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SoundListTableViewController: SoundTableViewCellDelegate {
    func didTapPlayButton(soundName: String, playButton: UIButton) {
        let path = Bundle.main.path(forResource: soundName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        //FIXME: Add method to remember the last playing song
        //       When I press a button to play another song, what happens is the one that was playing, stops.
        //       The image of the button of the song that was playing will remain as stop even if the song is already stopped.
        //       If I press the button of the song that is playing, everything works fine. Only then.
        
        if soundPlayer?.isPlaying ?? false {
            soundPlayer?.stop()
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            do {
                soundPlayer = try AVAudioPlayer(contentsOf: url)
                soundPlayer?.play()
                playButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
            } catch {
                print("Could not load sound file, \(error).")
            }
        }
    }
}
