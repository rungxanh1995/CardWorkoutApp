//
//  CardSelectionVC.swift
//  CardWorkoutA
//
//  Created by Joe Pham on 2021-06-12.
//

import UIKit

class CardSelectionVC: UIViewController {

	@IBOutlet var cardImageView: UIImageView!
	@IBOutlet var buttons: [UIButton]!
	private var cards: [UIImage] = CardDeck.allValues
	private var timer: Timer!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		for button in buttons {
			button.layer.cornerRadius = 8
		}
		startTimer()
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		timer.invalidate()
	}
	
	private func startTimer() {
		timer = Timer.scheduledTimer(
			timeInterval: 0.1,
			target: self,
			selector: #selector(showRandomImage),
			userInfo: nil,
			repeats: true)
	}
	
	@objc
	private func showRandomImage() {
		cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
	}
    
	@IBAction func stopButtonTapped(_ sender: UIButton) {
		timer.invalidate()
	}
	
	@IBAction func restartButtonTapped(_ sender: UIButton) {
		timer.invalidate()
		startTimer()
	}
}
