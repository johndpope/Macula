//
//  main.swift
//  Macula
//
//  Created by Shon on 8/26/18.
//

import Foundation

let nx = 200
let ny = 100

extension Color {
    public init(_ ray: Ray) {
        let unitDirection = ray.direction.normalized()
        let t = 0.5 * (unitDirection.y + 1.0)

        let unitVector = Vector(1, 1, 1)
        let sky = Vector(0.5, 0.7, 1.0)

        let final = (1.0-t) * unitVector + t * sky

        self.init(final.x, final.y, final.z)
    }
}

output("P3")
output("\(nx) \(ny)")
output("255")

let dbl_nx = Double(nx)
let dbl_ny = Double(ny)

let lowerLeft = Vector(-2, -1, -1)
let horizontal = Vector(4, 0, 0)
let vertical = Vector(0, 2, 0)
let origin = Vector.zero

for j in stride(from: ny-1, through: 0, by: -1) {
    let jj = Double(j)
    for i in 0..<nx {
        let ii = Double(i)

        let u = ii / dbl_nx
        let v = jj / dbl_ny

        let ray = Ray(origin: origin, direction: lowerLeft + u * horizontal + v * vertical)

        let color = Color(ray)
        let (rr, gg, bb) = color.scale()
        
        let r = Int(rr)
        let g = Int(gg)
        let b = Int(bb)
        
        output("\(r) \(g) \(b)")
    }
}

