//
//  ViewController.swift
//  Traffic Light ver2
//
//  Created by Алексей Попов on 31.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var grettingButton: UIButton!
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    private var currentLight: CurrentLight = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grettingButton.layer.cornerRadius = 10
        
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
        
        redView.alpha = lightIsOff
        greenView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
    }


    @IBAction func startGrettingButton() {
        
        if grettingButton.currentTitle == "Start" {
            grettingButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redView.alpha = lightIsOn
            greenView.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightIsOff
            yellowView.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowView.alpha = lightIsOff
            greenView.alpha = lightIsOn
            currentLight = .red
        }
    }
}
// MARK: - CurrentLight
extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
