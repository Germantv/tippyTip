//
//  ViewController.swift
//  tippyTip
//
//  Created by German Flores on 1/6/18.
//  Copyright © 2018 German Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 4
    }
    
    @IBAction func unwindToViewController(unwindSegue: UIStoryboardSegue) {
        //do not need to do anythins
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            let secondViewController = segue.destination as! SecondViewController
            
            let bill = Double(billField.text!) ?? 0
            let tipPercentages = [0.10, 0.15, 0.18, 0.22]
            let tip: Double = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total: Double = bill + tip
            
            secondViewController.textFromMainVC = tip
            secondViewController.textFromMainVCTotal = total
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //exits digits keyboard with tap of anywhere on screen
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

