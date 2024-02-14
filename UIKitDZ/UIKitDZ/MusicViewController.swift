// MusicViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// MusicViewController - окно где можно управлять музыкой

final class MusicViewController: UIViewController {
    // MARK: Все элементы из сториборда

    @IBOutlet private var slider: UISlider!
    @IBOutlet private var pauseImage: UIImageView!
    @IBOutlet private var volumeSlider: UISlider!
    @IBOutlet private var photoMusicImage: UIImageView!
    @IBOutlet private var groupNameLabel: UILabel!
    @IBOutlet private var timeMusicLabel: UILabel!
    @IBOutlet private var beforeMusicImage: UIImageView!
    @IBOutlet private var nextMusicImage: UIImageView!
    @IBOutlet private var musicName: UILabel!
    private var player = AVAudioPlayer()
    private var timer: Timer?
    var currentMusicIndex = 1

    // MARK: Массив для хранения музыки

    private let musics = [
        Music(name: "Let it be", group: "The Beatles"),
        Music(name: "Yesterday", group: "The Beatles"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: подключения слайдеров к их action

        volumeSlider.addTarget(self, action: #selector(changeVolume), for: .valueChanged)
        slider.isEnabled = true
        slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)

        // MARK: Добавление управляемости в фото

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pauseTapped))

        pauseImage.isUserInteractionEnabled = true
        pauseImage.addGestureRecognizer(tapGestureRecognizer)

        photoMusicImage.image = UIImage(named: musics[currentMusicIndex].name)

        playMusic(at: currentMusicIndex)

        // MARK: Изображения на фон

        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)

        // MARK: Жесты для image преведущий трек и следущий трек

        let previousTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(previousMusicTapped))
        beforeMusicImage.isUserInteractionEnabled = true
        beforeMusicImage.addGestureRecognizer(previousTapGestureRecognizer)

        let nextTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(nextMusicTapped))
        nextMusicImage.isUserInteractionEnabled = true
        nextMusicImage.addGestureRecognizer(nextTapGestureRecognizer)
    }

    // MARK: При закрытие стоп музыки

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        player.stop()
        timer?.invalidate()
        timer = nil
    }

    // MARK: Таймер плюс обновляет слайдер тоже

    final func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateSlider),
            userInfo: nil,
            repeats: true
        )
    }

    @IBAction func openButton(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Упс!",
            message: "Функционал в разработке",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Oк", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    final func playMusic(at index: Int) {
        let music = musics[index]
        groupNameLabel.text = music.group
        musicName.text = music.name
        do {
            if let audioPath = Bundle.main.path(forResource: music.name, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }

        player.play()
        startTimer()
    }

    @objc func updateSlider() {
        slider.value = Float(player.currentTime)
        let allTime = player.duration

        let minutes = Int(allTime - player.currentTime) / 60
        let seconds = Int(allTime - player.currentTime) % 60
        timeMusicLabel.text = "- \(minutes) : \(seconds / 10 == 0 ? "0\(String(seconds))" : "\(seconds)")"
        player.volume = volumeSlider.value
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

    @objc func nextMusicTapped() {
        currentMusicIndex = (currentMusicIndex + 1) % musics.count
        player.stop()
        playMusic(at: currentMusicIndex)
        pauseImage.image = UIImage(systemName: "pause.circle")
        pauseImage.tintColor = .white
        photoMusicImage.image = UIImage(named: musics[currentMusicIndex].name)
    }

    @objc func previousMusicTapped() {
        currentMusicIndex = (currentMusicIndex - 1 + musics.count) % musics.count
        player.stop()
        playMusic(at: currentMusicIndex)
        pauseImage.image = UIImage(systemName: "pause.circle")
        pauseImage.tintColor = .white
        photoMusicImage.image = UIImage(named: musics[currentMusicIndex].name)
    }
}
