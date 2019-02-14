//
//  FireStarter.swift
//  FireLabelFun
//
//  Created by Morten Gustafsson on 2/14/19.
//  Copyright © 2019 mortengustafsson. All rights reserved.
//

import UIKit

final class FireStarter {
    private lazy var cell: CAEmitterCell = {
        let cell = CAEmitterCell()
        cell.alphaSpeed = -0.3
        cell.lifetime = 60
        cell.birthRate = 600
        cell.lifetimeRange = 0.5
        cell.color = UIColor(red: 0.8, green: 0.4, blue: 0.2, alpha: 0.6).cgColor
        cell.contents = #imageLiteral(resourceName: "fire").cgImage
        cell.emissionLongitude = CGFloat.pi
        cell.velocity = 80
        cell.velocityRange = 5
        cell.emissionRange = 0.5
        cell.yAcceleration = -200
        cell.scaleSpeed = 0.3
        return cell
    }()

    private lazy var emitter: CAEmitterLayer = {
        let emitter = CAEmitterLayer()
        emitter.renderMode = CAEmitterLayerRenderMode.additive
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = [cell]
        return emitter
    }()

    public var size: CGSize = .zero {
        didSet {
            emitter.emitterPosition = CGPoint(x: size.width / 2, y: size.height)
            emitter.emitterSize = CGSize(width: size.width, height: size.height)
        }
    }

    public func getEmitterLayer() -> CAEmitterLayer {
        return emitter
    }
}
