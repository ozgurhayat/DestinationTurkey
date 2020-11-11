//
//  PlayerViewController.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 22/09/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VideoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var videoTableView: UITableView!

    let videos: [Video] = Video.fetchVideos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Video.fetchVideos().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as? VideoTableViewCell {
            
            let video = videos[indexPath.row]
            cell.video = video
            
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        if selectedRow == 0 {
        videoPlayer()
        }
    }
    
    func videoPlayer() {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v1", ofType: "mp4")!))

        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
        
        player.play()
    }
}
