//
//  ContentView.swift
//  CircleAnimation
//
//  Created by Novan Agung Waskito on 30/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var fill: CGFloat = 0.0
    var body: some View {
        ZStack {
            Color(UIColor(red: 11/255.0, green: 15/255.0, blue: 128/255.0, alpha: 1))
            ZStack{
                
                //Track Circle
                Circle()
                    .stroke(Color.white.opacity(0.3),
                            style: StrokeStyle(lineWidth: 30))
                
                //Animation Circle
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color.pink,
                            style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(Animation.linear(duration: 450.0))
                Text("PinkDotSG \(Int(self.fill * 1.0)) %")
                    .foregroundColor(Color.pink)
                    .font(.system(size: 32))
            }
            .padding(50)
        }
        .onTapGesture {
            //Increment method
            for x in 1...100 {
                DispatchQueue.main.asyncAfter(deadline: .now()+TimeInterval(x/30)) {
                    self.fill += 1
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
