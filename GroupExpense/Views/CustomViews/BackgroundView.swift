//
//  BackgroundView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        GeometryReader {
            radar in
            let height = radar.size.height
            let width = radar.size.width;
            ZStack {
                WaveShapeSecondLayer()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]),
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    )
                    .frame(width: width, height: height)
                    .shadow(radius: 10)
                
                WaveShapeFirstLayer()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
                    .frame(width: width, height: height)
            }
        }
        .ignoresSafeArea(.all)
    }
}

private struct WaveShapeFirstLayer : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: rect.height*0.7))
        
        path.addCurve(
            to: CGPoint(x:rect.width, y:rect.height*0.66),
            control1: CGPoint(x: rect.width*0.7, y: rect.height*0.75), control2: CGPoint(x: rect.width*0.8, y: rect.height*0.64))
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

private struct WaveShapeSecondLayer : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: rect.height*0.7))
        
        path.addCurve(
            to: CGPoint(x:rect.width, y:rect.height*0.72),
            control1: CGPoint(x: rect.width*0.7, y: rect.height*0.75), control2: CGPoint(x: rect.width*0.8, y: rect.height*0.69))
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path;
    }
}

#Preview {
    BackgroundView()
}
