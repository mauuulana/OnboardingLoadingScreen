//
//  ViewController.swift
//  OnboardingLoadingScreen
//
//  Created by Maul on 09/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barLoading: CustomHorizontalProgressBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    var timer = Timer()
    var secondPassed = 0
    var totalTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTime = 10
        secondPassed = 0
        barLoading.progress = 0.0
        
        imageView.image = nil
        labelText.text = ""
        
        barLoading.layer.borderWidth = 4
        barLoading.layer.borderColor = UIColor.systemBackground.cgColor
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            barLoading.progress = CGFloat(Float(secondPassed) / Float(totalTime))
            animateOnbooardInformation()
        } else {
            timer.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.performSegue(withIdentifier: "toMain", sender: nil)
            }
        }
    }
    
    func animateOnbooardInformation() {
        switch secondPassed {
        case 1:
            imageView.image = UIImage(named: "Slide1")
            labelText.text = "Lorem Ipsum Dolor 1"
        case 5:
            imageView.image = UIImage(named: "Slide2")
            labelText.text = "Lorem Ipsum Dolor 2"
        case 8:
            imageView.image = UIImage(named: "Slide3")
            labelText.text = "Lorem Ipsum Dolor 3"
        default:
            break
        }
    }
}

