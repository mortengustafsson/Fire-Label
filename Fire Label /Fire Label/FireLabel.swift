//
//  FireLabel.swift
//  FireLabelFun
//
//  Created by Morten Gustafsson on 2/11/19.
//  Copyright © 2019 mortengustafsson. All rights reserved.
//

import UIKit

final class FireLabel: UILabel {

    private let firstShadow: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Shadows.First.color
        label.textAlignment = Constants.textAlignment
        return label
    }()

    private let secondShadow: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Shadows.Second.color
        label.textAlignment = Constants.textAlignment
        return label
    }()

    private let maskLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = Constants.textAlignment
        return label
    }()

    private lazy var gradientView: UIView = {
        let view = UIView()
        view.layer.addSublayer(gradientLayer)
        view.mask = maskLabel
        return view
    }()

    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = Constants.Gradient.colors
        gradientLayer.locations = Constants.Gradient.locations
        return gradientLayer
    }()

    private var fireStarter = FireStarter()

    private lazy var firstShadowBottomAnchor = firstShadow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
    private lazy var secondShadowBottomAnchor = secondShadow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)

    override var font: UIFont! {
        didSet {
            firstShadow.font = font
            secondShadow.font = font
            maskLabel.font = font
        }
    }

    override var text: String? {
        didSet {
            firstShadow.text = text
            secondShadow.text = text
            maskLabel.text = text
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    private func setupLabel() {
        textColor = .clear
        backgroundColor = .clear

        addSubview(secondShadow)
        addSubview(firstShadow)
        addSubview(gradientView)

        startFire(on: gradientView)

        setupConstraints()
    }

    private func startFire(on view: UIView) {
        let fireLayer = fireStarter.getEmitterLayer()
        view.layer.addSublayer(fireLayer)
    }

    private func setupConstraints() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        firstShadow.translatesAutoresizingMaskIntoConstraints = false
        secondShadow.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),

            firstShadow.topAnchor.constraint(equalTo: topAnchor),
            firstShadow.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstShadow.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstShadowBottomAnchor,

            secondShadow.topAnchor.constraint(equalTo: topAnchor),
            secondShadow.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondShadow.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondShadowBottomAnchor])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientFrame = gradientView.frame

        gradientLayer.frame = gradientFrame
        maskLabel.frame = gradientFrame

        fireStarter.size = gradientFrame.size

        firstShadowBottomAnchor.constant = frame.height * Constants.Shadows.First.offsetValue
        secondShadowBottomAnchor.constant = frame.height * Constants.Shadows.Second.offsetValue
    }
}

extension FireLabel {
    enum Constants {
        static let textAlignment: NSTextAlignment = .center

        struct Shadows {
            struct First {
                static let color = #colorLiteral(red: 0.01983484456, green: 0.01983484456, blue: 0.01983484456, alpha: 1)
                static let offsetValue: CGFloat = 0.08
            }
            struct Second {
                static let color = #colorLiteral(red: 0.2648356541, green: 0.05872734463, blue: 0.02013706269, alpha: 1)
                static let offsetValue: CGFloat = 0.16
            }
        }

        struct Gradient {
            static let colors = [#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1).cgColor, #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1).cgColor, #colorLiteral(red: 0.5730650907, green: 0.2118584444, blue: 0.117514312, alpha: 1).cgColor, #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1).cgColor, #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor, #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor]
            static let locations: [NSNumber] = [0, 0.2, 0.3, 0.5, 0.6, 0.9]
        }
    }
}
