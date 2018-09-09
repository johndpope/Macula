//
//  main.swift
//  Macula
//
//  Created by Shon on 8/26/18.
//

import Foundation

let nx = 200
let ny = 100

output("P3")
output("\(nx) \(ny)")
output("255")

let dbl_nx = Double(nx)
let dbl_ny = Double(ny)

for j in stride(from: ny-1, through: 0, by: -1) {
	let jj = Double(j)
	for i in 0..<nx {
		let ii = Double(i)

		let r = Int((ii / dbl_nx) * 255.99)
		let g = Int((jj / dbl_ny) * 255.99)
		let b = Int(0.2 * 255.99)

		output("\(r) \(g) \(b)")
	}
}
