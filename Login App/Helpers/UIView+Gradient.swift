//
//  gradinetColorEx + UIView.swift
//  Login App
//
//  Created by Тадевос Курдоглян on 06.11.2024.
//

import UIKit

extension UIView {
    func setGradientBackground(colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
