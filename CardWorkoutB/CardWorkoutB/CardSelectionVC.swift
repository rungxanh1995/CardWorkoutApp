//
//  CardSelectionVC.swift
//  CardWorkoutB
//
//  Created by Joe Pham on 2021-06-12.
//

import UIKit

class CardSelectionVC: UIViewController {
	private let cardImageView 	= UIImageView()
	private let stopButton 		= CWButton(backgroundColor: .systemRed, title: "Stop!")
	private let restartButton 	= CWButton(backgroundColor: .systemGreen, title: "Restart")
	private let rulesButton 	= CWButton(backgroundColor: .systemBlue, title: "Rules")
	
	private var cards: [UIImage] = CardDeck.allValues
	private var timer: Timer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureUI()
		startTimer()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		timer.invalidate()
	}
}

extension CardSelectionVC {
	
	private func startTimer() {
		timer = Timer.scheduledTimer(
			timeInterval: 0.1,
			target: self,
			selector: #selector(showRandomCard),
			userInfo: nil,
			repeats: true)
	}
	
	@objc
	private func showRandomCard() {
		cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
	}
	
	@objc
	private func stopTimer() {
		timer.invalidate()
	}
	
	@objc
	private func restartTimer() {
		timer.invalidate()
		startTimer()
	}
	
	@objc
	private func presentRulesVC() {
		present(RulesVC(), animated: true)
	}
	
	private func configureUI() {
		configureCardImageView()
		configureStopButton()
		configureRestartButton()
		configureRulesButton()
	}
	
	private func configureCardImageView() {
		view.addSubview(cardImageView)
		cardImageView.translatesAutoresizingMaskIntoConstraints = false
		cardImageView.image = UIImage(named: "AS")
		NSLayoutConstraint.activate([
			cardImageView.widthAnchor.constraint(equalToConstant: 250),
			cardImageView.heightAnchor.constraint(equalToConstant: 350),
			cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
		])
	}
	
	private func configureStopButton() {
		view.addSubview(stopButton)
		stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
		NSLayoutConstraint.activate([
			stopButton.widthAnchor.constraint(equalToConstant: 260),
			stopButton.heightAnchor.constraint(equalToConstant: 50),
			stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
		])
	}
	
	private func configureRestartButton() {
		view.addSubview(restartButton)
		restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
		NSLayoutConstraint.activate([
			restartButton.widthAnchor.constraint(equalToConstant: 115),
			restartButton.heightAnchor.constraint(equalToConstant: 50),
			restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
			restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
		])
	}
	
	private func configureRulesButton() {
		view.addSubview(rulesButton)
		rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
		NSLayoutConstraint.activate([
			rulesButton.widthAnchor.constraint(equalToConstant: 115),
			rulesButton.heightAnchor.constraint(equalToConstant: 50),
			rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
			rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
		])
	}
}
