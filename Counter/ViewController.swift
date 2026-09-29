//
//  ViewController.swift
//  Counter
//
//  Created by S D on 28.09.2026.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    
    
    @IBOutlet weak var valueCounter: UILabel!
    
    @IBOutlet weak var buttonCounter: UIButton!
    
    
    @IBAction func pressButton(_ sender: Any) {
        
        counter += 1
        valueCounter.text = "\(counter)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueCounter.text = "\(counter)"
        
        // Do any additional setup after loading the view.
    }


}

