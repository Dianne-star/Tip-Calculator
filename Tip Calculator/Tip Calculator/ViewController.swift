//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Lakitaya, Dilianny on 7/19/20.
//  Copyright © 2020 Lakitaya, Dilianny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var percentageLabel: UILabel!
    var sliderSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onLongPressSlider(_ sender: Any) {
        tipSlider.isEnabled = true
        tipControl.isEnabled = false
        sliderSelected = true
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        tipSlider.isEnabled = false
        tipControl.isEnabled = true
        sliderSelected = false
    }
    @IBAction func calculateTip(_ sender: Any) {
        var tip = 0
        //Get the biil amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        let tipPercentages = [0.1, 0.15,0.2]
        
        if(sliderSelected){
        tip = Int(bill * Double(tipSlider.value/100))
        }
        else{
            tip = Int(Double(bill * tipPercentages[tipControl.selectedSegmentIndex]))}
        let total = bill + Double(tip)
        
        //Update the tip, slider percentage and total labels
        let value = String(format:"%.2f",tipSlider.value)
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = "$\(total)"
        percentageLabel.text = "\(value)%"
    }
}

