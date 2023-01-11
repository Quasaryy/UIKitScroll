//
//  ViewController.swift
//  UIKitScroll
//
//  Created by Yury on 11.01.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var slider: UISlider!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var segmentedControll: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: textLabel settings
        textLabel.textAlignment = .center
        textLabel.font = textLabel.font.withSize(35)
        textLabel.numberOfLines = 2
        
        // MARK: slider settings
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .yellow
        slider.value = 30
        textLabel.text = String(Int(slider.value))
        
        // MARK: textField settings
        textField.placeholder = "Enter any text"
        textField.clearButtonMode = .whileEditing
        
        // MARK: button settings
        button.layer.cornerRadius = 5
        
        // MARK: scrollView settings
        scrollView.keyboardDismissMode = .onDrag
        
        // MARK: stepper settings
        stepper.minimumValue = 30
        stepper.maximumValue = 40
        stepper.value = 35
        
        // MARK: segmentedControll settings
        segmentedControll.insertSegment(withTitle: "Third", at: 2, animated: true)
    }

    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .full
        dateFormater.timeStyle = .short
        textLabel.text = dateFormater.string(from: sender.date)
        //textLabel.text = sender.date.formatted(date: .complete, time: .shortened)
    }
    
    @IBAction func buttonAction() {
        if textField.text!.isEmpty {
            showAlert(title: "Text field is empty", message: "Please enter anything 😀")
            return
        }
        textLabel.text = textField.text
        textLabel.textColor = .magenta
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        textLabel.textColor = .blue
        textLabel.text = String(Int(slider.value))
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        textLabel.font = textLabel.font.withSize(CGFloat(sender.value))
    }
    
    @IBAction func segmentedControllAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            textLabel.textColor = .red
            textLabel.text = "First segment is selected"
        case 1:
            textLabel.textColor = .brown
            textLabel.text = "Second segment is selected"
        case 2:
            textLabel.textColor = .blue
            textLabel.text = "Third segment is selected"
        default:
            break
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        segmentedControll.isHidden = !sender.isOn
        textLabel.isHidden = !sender.isOn
        textField.isHidden = !sender.isOn
        button.isHidden = !sender.isOn
        stepper.isHidden = !sender.isOn
        datePicker.isHidden = !sender.isOn
        dateLabel.isHidden = !sender.isOn
        
    }
    
    
}

extension ViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(buttonOK)
        present(alert, animated: true)
    }
}

