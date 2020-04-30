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
        
        createSoundsArray()
        
    }
    
    func createSoundsArray() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix(".mp3") {
                let songName = Sound(name: item)
                sounds.append(songName)
            }
        }
        
        print(sounds)
        
        
//        let sound1 = Sound(name: "Banana Tree.mp3")
//        let sound2 = Sound(name: "Black Fedora.mp3")
//        let sound3 = Sound(name: "Enchanting.mp3")
//        let sound4 = Sound(name: "Mr. Mason.mp3")
//
//        sounds.append(sound1)
//        sounds.append(sound2)
//        sounds.append(sound3)
//        sounds.append(sound4)
        

    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sound = sounds[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SoundTableViewCell
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
    func didTapPlayButton(soundName: String) {
        let path = Bundle.main.path(forResource: soundName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            // Could not load sound file
        }
    }
}
