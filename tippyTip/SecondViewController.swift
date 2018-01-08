//
//  SecondViewController.swift
//  tippyTip
//
//  Created by German Flores on 1/7/18.
//  Copyright © 2018 German Flores. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var textFromMainVC: Double?
    var textFromMainVCTotal: Double?
    
    @IBOutlet weak var dismissButton: UIButton!
    let slideAnimator = SlideAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = String(format: "$%.2f", textFromMainVC!)
        totalLabel.text = String(format: "$%.2f", textFromMainVCTotal!)
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 4
    }

   //button action supposed to dismiss the second screen and send back to main menu
    @IBAction func dismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.transitioningDelegate = slideAnimator
    }
    
}
