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
    
    
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var nullButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    

    

    
    
    func dataFormat() {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: date)
        historyTextView.text += "\(dateString)\n значение изменено на \(counter)\n"
        let bottom = NSRange(location: historyTextView.text.count - 6, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    func dataFormatSubZero() {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: date)
        historyTextView.text += "\(dateString)\n попытка уменьшения ниже 0\n"
        let bottom = NSRange(location: historyTextView.text.count - 8, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    func dataFormatNull() {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: date)
        historyTextView.text += "\(dateString)\n значение сброшено\n"
        let bottom = NSRange(location: historyTextView.text.count - 4, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    
    @IBAction func pressPlusButton(_ sender: Any) {
        counter += 1
        valueCounter.text = "\(counter)"
        
        
        dataFormat()
        
        
    }
    
    
    @IBAction func pressMinusButton(_ sender: Any) {
      
        if counter > 0 {
            counter -= 1
            valueCounter.text = "\(counter)"
          
            dataFormat()
            
            
        } else if counter == 0 {
            
            dataFormatSubZero()
            
        }
        
        
    }
    
    @IBAction func pressNullButton(_ sender: Any) {
        counter = 0
        valueCounter.text = "\(counter)"
        
        dataFormatNull()

        
    }
    
    
            
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueCounter.text = "\(counter)"
        historyTextView.text = "История изменений\n"
        historyTextView.isEditable = false
        // Do any additional setup after loading the view.
    }


}

