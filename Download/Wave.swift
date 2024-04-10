//
//  Wave.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct Wave: Shape {
    
    var offset: Angle
    var percent: CGFloat
    var waveHeight: CGFloat
        
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { .init(offset.degrees, percent) }
        set {
            offset.degrees = newValue.first
            percent = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let lowestWave = 0.02
        let highestWave = 1.00
        
        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let yOffSet = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        path.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: x, y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

