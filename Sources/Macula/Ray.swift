//
//  Ray.swift
//  Macula
//
//  Created by Shon on 9/9/18.
//

import Foundation

public struct Ray {
    let origin: Vector
    let direction: Vector

    public func point(at t: Double) -> Vector {
        return origin + t * direction
    }
}
