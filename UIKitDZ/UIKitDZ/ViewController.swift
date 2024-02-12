// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    var musicViewController: MusicViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Укажите имя вашего сториборда
        musicViewController = storyboard
            .instantiateViewController(withIdentifier: "MusicViewController") as? MusicViewController
    }

    @IBAction func letButton(_ sender: Any) {
        musicViewController?.currentMusicIndex = 0
        presentMusicViewController()
    }

    @IBAction func yesterdayButton(_ sender: Any) {
        musicViewController?.currentMusicIndex = 1
        presentMusicViewController()
    }

    private func presentMusicViewController() {
        if let musicViewController = musicViewController {
            present(musicViewController, animated: true, completion: nil)
        }
    }
}
