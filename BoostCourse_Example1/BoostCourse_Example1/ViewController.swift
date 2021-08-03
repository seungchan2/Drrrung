//
//  ViewController.swift
//  BoostCourse_Example1
//
//  Created by 김승찬 on 2021/07/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //MARK: - Properties
    
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePlayer()
        addPlayPauseButton()
    }
    
    // MARK: - Functions
    
    // 처음 Player 초기화 메서드
    func initializePlayer() {
        // 해당 파일이 존재하지 않을 수 있기 때문에 옵셔널의 형태로 반환
        // 그 과정에서 unwrapping 과정이 필요
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            return
        }
        // do ~ catch 구문에서 try는 필수
        // try -> "이 함수가 오류가 발생할 수 있는데, 한번 시도해보겠다"
        // do {
        // try 오류 발생 코드
        // } catch 오류 패턴 1 { 오류 종류에 따른 대응 구현
        // }
        // catch { 에러의 종류를 명시하지 않고 코드 블럭을 생성하면 블록 내부에 error라는 지역 상수가 암시적으로 생성
        // print(error)
        // }
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch _ as NSError {
            
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    // 매초마다 Label 업데이트
    func updateTimeLabelText(time: TimeInterval) {
        //truncatingRemainder(dividingBy: ) -> Double, Float의 나머지 값 구하는 메서드
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milesecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        // String타입으로 선언하고..
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milesecond)
        self.timeLabel.text = timeText
    }
    
    // 타이머 만들고 수행하는 메서드
    func makeAndFireTimer() {
        // [unowned] / isTracking
        // 마지막으로 반드시 fire() 메서드를 통해 타이머를 시작해줘야 함 !
        // 또한 타이머의 역할이 끝나면 반드시 invalidate를 통해 해제 !
        // 0.01초마다 행해지는 행위를 block 에 명시해주어야 함.
        // 슬라이더를 움직일 때는 값들을 밀리세컨드 단위로 갱신하지 않고
        // 슬라이더 값에 따라 갱신하기 위해 if self.progressSlider.isTracking { return }
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true,
            block: { [unowned self] (timer: Timer) in
            
            if self.progressSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    // 타이머 해제 메서드
    func invalidateTimer() {
        self.timer.invalidate()
//        self.timer = nil
        //-> self.timer = nil 을 해주면 다시 재생이 안됨 Optional Error 발생
    }
    
    // image : normal -> play , selected -> pause
    func addPlayPauseButton() {
        playPauseButton.setImage(UIImage(named: "button_play"), for: UIControl.State.normal)
        playPauseButton.setImage(UIImage(named: "button_pause"), for: UIControl.State.selected)
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchPlayPauseButton(_ sender: UIButton) {
        
        // isSelected 를 활용한 재생 - 정지
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }

        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // 슬라이더를 움직여 원하는 재생 구간으로 이동할 때 슬라이더의 값에 따라 라벨 갱신
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        // 슬라이더를 움직이는 동안은 재생되는 구간이 바뀌지 않고 슬라이더의 움직임을 멈추었을 때
        // 비로소 해당 위치를 재상하게 하므로 움직이는 동안 음원이 끊기는 현상을 막기 위함
        if sender.isTracking { return }
        // 슬라이더의 움직이 멈췄을 때 currentTime의 값을 슬라이더 값에 맞추어 할당하므로 원하는 구간으로의
        // 이동이 가능해짐 !
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    //MARK: - AVAudioPlayerDelegate
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            return
        }
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)

        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in

            self.dismiss(animated: true, completion: nil)
        }

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        //-> 이 코드로 인해 재생 완료 후 다시 플레이버튼으로 바뀜
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
    
}

