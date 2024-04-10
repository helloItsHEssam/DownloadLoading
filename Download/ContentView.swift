//
//  ContentView.swift
//  Download
//
//  Created by HEssam on 4/10/24.
//

import SwiftUI

struct ContentView: View {

    @State private var tickProgress: CGFloat = 0.0
    @State private var offsetVerticalArrow: CGFloat = 0
    @State private var circleProgress: CGFloat = 0
    @State private var arrowHeight: CGFloat = 50
    @State private var wavePercent: CGFloat = -30
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: -40)
    
    private var animation: Animation = {
        .easeOut(duration: 0.8)
    }()
    
    private var rotateAnimation: Animation = {
        .easeOut(duration: 1.5)
    }()
    
    private var moveArrowAnimation: Animation = {
        .easeOut(duration: 0.5)
        .repeatForever(autoreverses: true)
    }()
    
    @State var rotate: CGFloat = 0

    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()

            Waves(percent: $wavePercent, waveOffset: $waveOffset, waveOffset2: $waveOffset2)
            
            Circle()
                .fill(.clear)
                .stroke(.circleStroke,
                        style: .init(lineWidth: 8))
                .frame(width: 200, height: 200)
            
            ProgressCircle(maxTrim: $circleProgress)
            
            Arrow(rotatePercent: rotate)
                .stroke(.white, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .bevel))
                .frame(width: 30, height: arrowHeight)
                .offset(y: offsetVerticalArrow)
            
            Tick()
                .trim(from: 0.0, to: tickProgress)
                .stroke(.tick,
                        style: .init(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .frame(width: 50, height: 50)
                .animation(animation, value: tickProgress)
        }
        .onAppear {
            withAnimation(.linear(duration: 0.4)) {
                offsetVerticalArrow = -20
                
            } completion: {
                withAnimation(.linear(duration: 1.5)) {
                    rotate = 1.0
                    offsetVerticalArrow = 75
                    
                } completion: {
                    circleProgress = 1.0
                    
                    withAnimation(.linear(duration: 0.4)) {
                        offsetVerticalArrow = 100.0
                        arrowHeight = 0.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        waveOffset = .degrees(360)
                        waveOffset2 = .degrees(-360 - 40)
                        wavePercent = 120
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        tickProgress = 1.0
                    }
                    
                }
            }

            
        }
    }
}

#Preview {
    ContentView()
}
