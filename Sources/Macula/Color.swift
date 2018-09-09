//
//  Color.swift
//  Macula
//
//  Created by Shon on 9/9/18.
//

import Foundation

/*
 * Describe clamping
 */
public enum ClampingStyle {
    case unit // Clamp to the usual [0,1] range
    case range(Double, Double) // Clamp to the specified range
}

/*
 * Extend Double to support clamping
 */
extension Double {
    func clamp(_ style: ClampingStyle = .unit) -> Double {
        switch style {
        case .unit:
            return clamp(.range(0, 1))
        case .range(let lo, let hi):
            return self < lo ? lo : (self > hi ? hi : self)
        }
    }
}

/*
 * Represents RGB values, each with a range [0.0, 1.0]
 */
public struct Color {
    let red: Double
    let green: Double
    let blue: Double

    /*
     * Clamps values to [0,1]
     */
    public init(_ red: Double, _ green: Double, _ blue: Double) {
        self.red = red.clamp()
        self.green = green.clamp()
        self.blue = blue.clamp()
    }

    public func scale(_ to: (min: Double, max: Double) = (0, 255.99)) -> (Double, Double, Double) {
        let s = to.max - to.min
        let r = red * s + to.min
        let g = green * s + to.min
        let b = blue * s + to.min

        return (r,g,b)
    }
}
