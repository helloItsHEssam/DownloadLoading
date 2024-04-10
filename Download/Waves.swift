//
//  Waves.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct Waves: View {
    
    @Binding private var percent: CGFloat
    @Binding private var waveOffset: Angle
    @Binding private var waveOffset2: Angle
    
    init(percent: Binding<CGFloat>, waveOffset: Binding<Angle>, waveOffset2: Binding<Angle>) {
        self._percent = percent
        self._waveOffset = waveOffset
        self._waveOffset2 = waveOffset2
    }
    
    private var animation: Animation = {
        .linear(duration: 3.0)
    }()
    
    var body: some View {
        ZStack {
            Wave(offset: waveOffset2, percent: percent, waveHeight: 10)
                .fill(.backCircle)
                .animation(animation, value: waveOffset2)
                .animation(animation, value: percent)
            
            Wave(offset: waveOffset, percent: percent, waveHeight: 10)
                .fill(.frontCircle.opacity(0.8))
                .animation(animation, value: waveOffset)
                .animation(animation, value: percent)
        }
        .frame(width: 200, height: 200)
        .clipShape(Circle())
    }
}

