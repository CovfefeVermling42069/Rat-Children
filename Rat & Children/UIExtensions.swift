//
//  UIButtonExtensions.swift
//  Rat & Children
//
//  Created by paul alcott on 3/10/20.
//  Copyright © 2020 paul alcott. All rights reserved.
//
import UIKit
import AVFoundation
import SwiftUI

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 1.0
        pulse.toValue = 1.4
        pulse.autoreverses = true
        pulse.repeatCount = 0
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}

extension UIView {
    func throb() {
        let throb = CASpringAnimation(keyPath: "transform.background")
        throb.duration = 0.2
        throb.fromValue = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        throb.toValue = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        throb.autoreverses = true
        throb.repeatCount = 5
        throb.initialVelocity = 0.5
        throb.damping = 1.0
        layer.add(throb, forKey: nil)    }
}
