//
//  ViewController.swift
//  Fire Label
//
//  Created by Morten Gustafsson on 2/14/19.
//  Copyright © 2019 Morten Gustafsson. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    private let fireLabel: UILabel = {
        let fireLabel = FireLabel()
        fireLabel.text = "Heavy Fire".uppercased()
        fireLabel.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 120)
        return fireLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01983484456, green: 0.01983484456, blue: 0.01983484456, alpha: 1)

        view.addSubview(fireLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        fireLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            fireLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fireLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10)])
    }
}
