// MusicViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// MusicViewController
class MusicViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var pauseImage: UIImageView!
    @IBOutlet var volumeSlider: UISlider!
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeSlider.addTarget(self, action: #selector(changeVolume), for: .valueChanged)
        slider.isEnabled = true
        slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pauseTapped))
        pauseImage.isUserInteractionEnabled = true
        pauseImage.addGestureRecognizer(tapGestureRecognizer)

        do {
            if let audioPath = Bundle.main.path(forResource: "Let", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }

        player.play()

        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView
            .image = UIImage(named: "background") // Замените "yourImageName" на имя вашего изображения
        backgroundImageView.contentMode = .scaleAspectFill // Растягивание изображения под размеры экрана
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView) // Do any additional setup after loading the view.
    }

    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @objc func changeVolume(sender: UISlider) {
        player.volume = sender.value
    }

    @objc func pauseTapped() {
        if player.isPlaying {
            pauseImage.image = UIImage(systemName: "play.circle")
            pauseImage.tintColor = .white
            player.pause()
        } else {
            pauseImage.image = UIImage(systemName: "pause.circle")
            pauseImage.tintColor = .white
            player.play()
        }
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
