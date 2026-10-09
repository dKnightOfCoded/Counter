//
//  ViewController.swift
//  Counter
//
//  Created by S D on 28.09.2026.
//

import UIKit

final class CounterViewController: UIViewController {

    
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    
    
    
    // MARK: - Properties
    
    private var counter = 0
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "\(counter)"
        historyTextView.text = "История изменений\n"
        historyTextView.isEditable = false
        
    }
    
    
    
    
    // MARK: - IBActions
    
    @IBAction private func didTapPlusButton(_ sender: Any) {
        
        counter += 1
        counterLabel.text = "\(counter)"
        
        addHistoryEvent("значение изменено на +1")
            
    }
    
    
    @IBAction private func didTapMinusButton(_ sender: Any) {
      
        guard counter > 0 else {
                addHistoryEvent("попытка уменьшения ниже 0")
                return
            }

            counter -= 1
            updateCounterLabel()
            addHistoryEvent("значение изменено на -1")
        
        
    }
    
    
    @IBAction private func didTapResetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        
        addHistoryEvent("значение сброшено")
       
    }
    
    
    
    // MARK: - Private Methods
    
    private func addHistoryEvent(_ message: String) {
        let date = dateFormatter.string(from: Date())
        historyTextView.text += "\(date)\n\(message)\n"

        let bottom = NSRange(
            location: historyTextView.text.count - 5,
            length: 1
        )
                
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    
    
    
    private func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
    
    

    

    
    
            
    
    



}

