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
        
        let color = Color(ii / dbl_nx, jj / dbl_ny, 0.2)
        let (rr, gg, bb) = color.scale()
        
        let r = Int(rr)
        let g = Int(gg)
        let b = Int(bb)
        
        output("\(r) \(g) \(b)")
    }
}
