//
//  ProgressCircle.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct ProgressCircle: View {
    
    @Binding private var maxTrim: CGFloat
    
    init(maxTrim: Binding<CGFloat>) {
        self._maxTrim = maxTrim
    }

    private var animation: Animation = {
        .easeOut(duration: 4.0)
    }()
    
    var body: some View {
        ZStack {
            HalfCircle()
                .trim(from: 0.0, to: maxTrim)
                .stroke(.white,
                        style: .init(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .animation(animation, value: maxTrim)
            
            HalfCircle()
                .trim(from: 0.0, to: maxTrim)
                .stroke(.white,
                        style: .init(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .scaleEffect(x: -1.0, y: 1.0)
                .animation(animation, value: maxTrim)
        }
        .frame(width: 200, height: 200)
    }
}
