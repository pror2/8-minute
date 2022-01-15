//
//  ViewController.swift
//  NoStorybord2(9 minute.ver.2.0)
//
//  Created by Admin2 on 14.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let  mainLabel : UILabel = {
        let label = UILabel()
        label.text = "Turn on the timer,\n Close your eyes,\n Relax"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let  taimerLabel : UILabel = {
        let label = UILabel()
        label.text = "485"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let startButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 30
        button.setTitle("START", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    var player: AVAudioPlayer!
    
    var timer  = Timer()
    
    var shapeLayer = CAShapeLayer()
    
    var durationTimer = 485
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        taimerLabel.text = "\(durationTimer)"
        
        view.backgroundColor = #colorLiteral(red: 0.6648116708, green: 0.6787632704, blue: 1, alpha: 1)
        
        setConstraints()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        
        
        
    }

    @objc func startButtonTapped() {
        
        basicAnimation()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        playSound(soundName: "meditation8")
        
    }
    
        
    @objc func timerAction() {
        
        durationTimer -= 1
        taimerLabel.text = "\(durationTimer)"
        print(durationTimer)
        
        if durationTimer <= 0 {
            
            timer.invalidate()
            taimerLabel.text = "\(durationTimer)"
            
        }
        
        
            
    }

    // Basic Animation
    
    func animationCircular() {
        
        let center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2 )
        
        let endAngle = ( -CGFloat.pi / 2)

        let startAngle = 2 * CGFloat.pi + endAngle
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 138, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 25
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = #colorLiteral(red: 0.05882352941, green: 0.01568627451, blue: 0.2980392157, alpha: 1).cgColor
        view.layer.addSublayer(shapeLayer)
         
    }
    func basicAnimation() {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

extension ViewController {
    
    func setConstraints() {
        
        view.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(taimerLabel)
        NSLayoutConstraint.activate([
            taimerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taimerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
}

