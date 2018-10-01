
// Created on: 01-Oct-2018
// Created by: Natalie Beshara
// Created for: ICS3U
// This program calculates how high the object is currently is above ground

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel = UILabel()
    let secondsLabel = UILabel()
    let secondsTextField = UITextField()
    let calcuateButton = UIButton()
    let heightLabel = UILabel()
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Enter the number of seconds since the object was dropped, in seconds"
        instructionsLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        secondsLabel.text = "Enter seconds"
        secondsLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(secondsLabel)
        secondsLabel.translatesAutoresizingMaskIntoConstraints = false
        secondsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondsLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        
        secondsTextField.borderStyle = UITextBorderStyle.roundedRect
        secondsTextField.placeholder = "In cm   "
        view.addSubview(secondsTextField)
        secondsTextField.translatesAutoresizingMaskIntoConstraints = false
        secondsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        secondsTextField.bottomAnchor.constraint(equalTo: secondsLabel.topAnchor, constant: 27).isActive = true
        
        calcuateButton.setTitle("Calculate", for: UIControlState.normal)
        calcuateButton.setTitleColor(.blue, for: .normal)
        calcuateButton.addTarget(self, action: #selector(calculateHeight), for: .touchUpInside)
        view.addSubview(calcuateButton)
        calcuateButton.translatesAutoresizingMaskIntoConstraints = false
        calcuateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        calcuateButton.topAnchor.constraint(equalTo: secondsLabel.bottomAnchor, constant: 20).isActive = true
        
        heightLabel.text = nil
        heightLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        heightLabel.topAnchor.constraint(equalTo: calcuateButton.bottomAnchor, constant: 20).isActive = true
    }
    @objc func calculateHeight() {
        // calculate the height of object 
        
        // Gravity is g=9.81 m/s^2
        let GR : Double = 9.81
        
        let seconds : Double = Double(secondsTextField.text!)!
        
        var height : Double = 100 - (1/2) * GR * pow(seconds,2)
        
        if height < 0 {
            height = 0
        }
        
        heightLabel.text =  "The height of the object is: \(height) cm"
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
