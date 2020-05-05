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
    
    var sounds = Sounds()
    var soundManager = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SoundTableViewCell", bundle: nil), forCellReuseIdentifier: K.soundCell)
        // Hide excess cells in tableView
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        soundManager.stop()
    }
    
    func getViewIndexInTableView(tableView: UITableView, view: UIView) -> IndexPath? {
        let position = view.convert(CGPoint.zero, to: tableView)
        
        return tableView.indexPathForRow(at: position)
    }
    
    func changeButtonImage(for button: UIButton, play: Bool) {
        UIView.transition(with: button,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                            button.setImage(UIImage(systemName: play ? K.playImage : K.stopImage), for: .normal)
                            
        }, completion: nil)
    }
    
    func stopCurrentlyPlayingSound() {
        if let currentSound = soundManager.currentlyPlaying() {
            soundManager.stop()
            if let indexStop = sounds.getPosition(currentSound) {
                let cell = tableView.cellForRow(at: IndexPath(item: indexStop, section: 0)) as! SoundTableViewCell
                changeButtonImage(for: cell.playButton, play: true)
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sound = sounds.getSound(at: indexPath.row)!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.soundCell, for: indexPath) as! SoundTableViewCell
        cell.delegate = self
        cell.setSound(sound: sound)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            defer {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        
        let sound = sounds.getSound(at: indexPath.row)
        performSegue(withIdentifier: K.Segue.goToAlarmEdit, sender: sound)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! AlarmEditTableViewController
        guard
            let indexPath = tableView.indexPathForSelectedRow
        else {
            return
        }
        
        let sound = sounds.getSound(at: indexPath.row)
        destVC.selectedSound = sound
    }
    
    

}

//MARK: - SoundTableViewCellDelegate

extension SoundListTableViewController: SoundTableViewCellDelegate {
    
    func didTapPlayButton(playButton: UIButton) {
        if let index = getViewIndexInTableView(tableView: tableView, view: playButton),
            let sound = sounds.getSound(at: index.row) {
            // If the sound is located in the same cell as the currently playing one - stop playing it and return
            guard sound != soundManager.currentlyPlaying() else {
                stopCurrentlyPlayingSound()
                return
            }
            // Stop any sound that is playing
            stopCurrentlyPlayingSound()
            // Start playing the new sound
            soundManager.play(this: sound)
            changeButtonImage(for: playButton, play: false)
        }
    }
    
}
