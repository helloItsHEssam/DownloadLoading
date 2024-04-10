//
//  HalfCircle.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct HalfCircle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: .init(x: rect.midX, y: rect.midY),
            radius: rect.midX,
            startAngle: .degrees(90),
            endAngle: .degrees(270),
            clockwise: true
        )
        
        return path
    }
}
