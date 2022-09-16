//
//  SplashScreen.swift
//  sample
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct SplashScreen: View {
    
    @ObservedObject var soundplayer = SoundPlayer()
    @State var splashscreenFinished = true
    
    @State private var torixVal: CGFloat = 0.0 // 魚のスタート地点の座標（x）
    @State private var toriyVal: CGFloat = 0.0 // 魚のスタート地点の座標（y）
    @State private var SwiftUIxVal: CGFloat = 0.0 // 文字の座標（x）
    @State private var SwiftUIyVal: CGFloat = 0.0 // 文字の座標（y）
    @State private var torikagoxVal: CGFloat = 0.0 // 釣り竿の針の座標（x）
    @State private var torikagoyVal: CGFloat = 0.0 // 釣り竿の針の座標（y）
    
    @State private var timer = Timer.publish(every: 0.04, on: .main, in: .common).autoconnect()
    var body: some View {
        if splashscreenFinished == true {
        ZStack {
            Image("spbga")
                .ignoresSafeArea()
            
            
        ZStack {

                
          
//            Image("topmozi")
//                .resizable( )
//                //.renderingMode(.template)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 650, height: 650)
//                .offset(x: SwiftUIxVal + -40 , y: SwiftUIyVal - 40)
//                .padding(150)
               
            
            Image("fish")  //image attached
                .resizable()
                .frame(width: 500, height: 250) // 250 : 200
                .aspectRatio(contentMode: .fit)
                .offset(x: torixVal + -450 , y: toriyVal + 240) // 260 : 240
                .transition(.slide)
                .padding(360)
                .onReceive(timer) {_ in

                    if torixVal <= 370 { // 370 : 360
                        torixVal += 7
                    }
                }
                    
        }
        .onAppear { // 0.3
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation(.linear(duration: 2)) {
                    soundplayer.eatPlay()
                }
                
            } // 2.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                withAnimation {
                    splashscreenFinished.toggle()
                }
            }
            
        }
      //  .foregroundColor(.white)
        }
        } else {
            TopView()
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
