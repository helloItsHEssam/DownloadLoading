//
//  Tick.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct Tick: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let midX = rect.midX
        let midY = rect.midY
        let minX = rect.minX
        let maxX = rect.maxX
        let aLittleLessThanMidX = midX * 3 / 4
        let aLittleLessThanMaxY = midY + midY / 2
        
        path.move(to: .init(x: minX, y: midY))
        path.addLine(to: .init(x: aLittleLessThanMidX, y: aLittleLessThanMaxY))
        path.addLine(to: .init(x: maxX, y: 0))
        
        return path
    }
}
