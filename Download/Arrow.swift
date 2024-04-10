//
//  Arrow.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct Arrow: Shape {
    
    var rotatePercent: CGFloat
    
    var animatableData: CGFloat {
        get { rotatePercent }
        set { rotatePercent = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let midX = rect.midX
        let maxY = rect.maxY
        let edgeY = rect.maxY - rect.maxY * 0.3
        
        path.move(to: .init(x: midX, y: 0))
        path.addLine(to: .init(x: midX, y: maxY))
        
        let diff = (rect.width - midX)
        let newXLeftEdgePosition = diff * rotatePercent
        path.move(to: .init(x: newXLeftEdgePosition, y: edgeY))
        path.addLine(to: .init(x: midX, y: maxY))

        let newXRightEdgePosition = diff - diff * rotatePercent
        path.move(to: .init(x: midX + newXRightEdgePosition, y: edgeY))
        path.addLine(to: .init(x: midX, y: maxY))
        
        return path
    }
}
