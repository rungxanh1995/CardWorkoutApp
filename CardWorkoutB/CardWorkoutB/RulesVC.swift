//
//  RulesVC.swift
//  CardWorkoutB
//
//  Created by Joe Pham on 2021-06-12.
//

import UIKit

class RulesVC: UIViewController {
	let titleLabel 		= UILabel()
	let rulesLabel 		= UILabel()
	let exerciseLabel 	= UILabel()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureUI()
		
	}
	
	private func configureUI() {
		configureTitleLabel()
		configureRulesLabel()
		configureExerciseLabel()
	}
	
	private func configureTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "Rules"
		titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
		titleLabel.textAlignment = .center
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			
		])
	}
	
	private func configureRulesLabel() {
		view.addSubview(rulesLabel)
		rulesLabel.translatesAutoresizingMaskIntoConstraints = false
		rulesLabel.text = """
			The value of each card represents the number of exercise you do.\n
			J = 11, Q = 12, K = 13, A = 14
			"""
		rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
		rulesLabel.textAlignment = .center
		rulesLabel.lineBreakMode = .byWordWrapping
		rulesLabel.numberOfLines = 0
		NSLayoutConstraint.activate([
			rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
			rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
		])
	}
	
	private func configureExerciseLabel() {
		view.addSubview(exerciseLabel)
		exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
		exerciseLabel.text = """
			♠️ = Push-up\n
			❤️ = Sit-up\n
			♣️ = Burpees\n
			♦️ = Jumping Jacks
			"""
		exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
		exerciseLabel.numberOfLines = 0
		NSLayoutConstraint.activate([
			exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 50),
			exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
			exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}
