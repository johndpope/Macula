//
//  main.swift
//  Macula
//
//  Created by Shon on 8/26/18.
//

import Foundation

let nx = 200
let ny = 100

extension Ray {
	public func doesHitSphere(center: Vector, radius: Double) -> Bool {
		let oc = self.origin - center
		let a = dot(self.direction, self.direction)
		let b = 2.0 * dot(oc, self.direction)
		let c = dot(oc, oc) - radius * radius
		let discriminant = b*b - 4*a*c

		return discriminant > 0
	}
}

extension Color {
    public init(_ ray: Ray) {
		if ray.doesHitSphere(center: Vector(0,0,-1), radius: 0.5) {
			self.init(1,0,0)
			return
		}

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

