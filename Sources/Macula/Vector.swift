//
//  Vector.swift
//  Macula
//
//  Created by Shon on 8/26/18.
//

import Foundation

/*
 * Represents a basic 3D vector
 */
public struct Vector {
    let x: Double
    let y: Double
    let z: Double

    public init(_ x: Double, _ y: Double, _ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }

    public static var zero: Vector {
        return Vector(0,0,0)
    }

    public var squaredLength: Double {
        return x*x + y*y + z*z
    }

    public var length: Double {
        return sqrt(squaredLength)
    }

    /*
     * Normalize this vector into a new unit vector
     */
    public func normalized() -> Vector {
        guard length != 0 else {
            return Vector.zero
        }

        return self / length
    }
}

prefix func +(_ v: Vector) -> Vector {
    return v
}

prefix func -(_ v: Vector) -> Vector {
    return Vector(-v.x, -v.y, -v.z)
}

func +(_ v1: Vector, _ v2: Vector) -> Vector {
    return Vector(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
}

func -(_ v1: Vector, _ v2: Vector) -> Vector {
    return Vector(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
}

func *(_ v1: Vector, _ v2: Vector) -> Vector {
    return Vector(v1.x * v2.x, v1.y * v2.y, v1.z * v2.z)
}

func /(_ v1: Vector, _ v2: Vector) -> Vector {
    guard ((v2.x != 0) && (v2.y != 0) && (v2.z != 0)) else {
        return Vector.zero
    }

    return Vector(v1.x / v2.x, v1.y / v2.y, v1.z / v2.z)
}

func *(_ v: Vector, _ s: Double) -> Vector {
    return Vector(v.x * s, v.y * s, v.z * s)
}

func *(_ s: Double, _ v: Vector) -> Vector {
    return v * s
}

func /(_ v: Vector, _ d: Double) -> Vector {
    guard d != 0 else {
        return Vector.zero
    }

    return Vector(v.x / d, v.y / d, v.z / d)
}

func dot(_ v1: Vector, _ v2: Vector) -> Double {
    return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
}

func cross(_ v1: Vector, _ v2: Vector) -> Vector {
    return Vector(
        v1.y * v2.z - v1.z * v2.y,
        -(v1.x * v2.z - v1.z * v2.x),
        v1.x * v2.y - v1.y * v2.x
    )
}

extension Vector: CustomStringConvertible {
    public var description: String {
        return "<\(x), \(y), \(z)>"
    }
}
