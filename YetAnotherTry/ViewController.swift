//
//  ViewController.swift
//  YetAnotherTry
//
//  Created by TeamGros on 4/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var darkBlueBackground: UIImageView!
    @IBOutlet weak var launchButton: UIButton!
    @IBOutlet weak var cloudHoldingView: UIView!
    
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var launchLabel: UILabel!
    
    var launched  = false
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        let landTap = UITapGestureRecognizer(target: self, action: Selector(("landPressed:")))
        
        hiLabel.addGestureRecognizer(landTap)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }
        catch let error as NSError {
            print(error.description + "Dan is cool:" + path)
        }
    }

    @IBAction func landPressed(_ sender: Any) {
        print("land pressed")
        landRocket()
    }
    
    @IBAction func launchPressed(_ sender: Any) {
        print("launch pressed")
        launchRocket()
    }
    
    func launchRocket()
    {
        print("current center: \(rocket.center.x),\(self.rocket.center.y)")
        player.play()
        cloudHoldingView.isHidden = false
        darkBlueBackground.isHidden = true
        launchButton.isHidden = true
        self.rocket.isHidden = false
        print("prelaunch rocket x,y:\(self.rocket.center.x),\(self.rocket.center.y)")
        print("prelaunch rocket height:\(self.rocket.frame.height)")
        UIView.animate(withDuration: 3, animations: { () -> Void in
            //self.rocket.center.y -= 300
            self.rocket.transform = CGAffineTransform(translationX: 1, y: -300)
        },
                       completion: { (finito) -> Void in
                        self.hiLabel.isHidden = false
                        self.launchButton.isHidden = false
                        self.launchLabel.isHidden = false
                        print("completed launch")
                        print("prelaunch rocket height:\(self.rocket.frame.height)")
        })

        print("post launch rocket x,y:\(self.rocket.center.x),\(self.rocket.center.y)")
    }
    
    func landRocket()
    {
        player.play()
        print("current rocket x,y:\(self.rocket.center.x),\(self.rocket.center.y)")
        print("la ding rocket height:\(self.rocket.frame.height)")
        UIView.animate(withDuration: 2.3,
                       animations: { () ->  Void in
            
            self.rocket.transform = CGAffineTransform(translationX: 1, y: 300)
            },
        completion: { (finished) -> Void in
            self.cloudHoldingView.isHidden = true
            self.launchLabel.isHidden = true
            self.darkBlueBackground.isHidden = false
            self.launchButton.isHidden = false
            self.hiLabel.isHidden = true
        })
        print("finished x,y:\(self.rocket.center.x),\(self.rocket.center.y)")
    }
    
    
}

