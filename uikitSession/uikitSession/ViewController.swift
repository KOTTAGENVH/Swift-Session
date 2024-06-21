//  ViewController.swift
//  uikitSession
//
//  Created by Nowen on 2024-06-20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var conversiondisplay: UITextField!
    @IBOutlet var buttonselector: UIButton!
    @IBOutlet var textinput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Configure button selector to show menu on click
        configureButtonSelector()
    }
    
    func configureButtonSelector() {
        let menu = UIMenu(title: "Choose Conversion", children: [
            UIAction(title: "cm to meter", handler: { _ in self.convert(unit: "cm to meter") }),
            UIAction(title: "cm to inches", handler: { _ in self.convert(unit: "cm to inches") })
        ])
        buttonselector.menu = menu
        buttonselector.showsMenuAsPrimaryAction = true
    }
    
    func convert(unit: String) {
        guard let inputText = textinput.text, let value = Double(inputText) else {
            conversiondisplay.text = "Invalid input"
            return
        }
        
        var result: Double = 0.0
        switch unit {
        case "cm to meter":
            result = value / 100.0
        case "cm to inches":
            result = value / 2.54
        default:
            break
        }
        
        conversiondisplay.text = String(result)
    }
}
