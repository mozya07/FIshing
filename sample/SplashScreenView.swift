//
//  SplashScreenView.swift
//  sample
//
//  Created by cmStudent on 2022/09/02.
//

import SwiftUI

struct SplashScreenView: View {
    @State var bowAnimation = false
    @State var isFinished = false
    
    @State private var torixVal: CGFloat = 0.0
    @State private var toriyVal: CGFloat = 0.0
    @State private var SwiftUIxVal: CGFloat = 0.0
    @State private var SwiftUIyVal: CGFloat = 0.0
    @State private var torikagoxVal: CGFloat = 0.0
    @State private var torikagoyVal: CGFloat = 0.0
    @State private var senterHWxVal: CGFloat = 0.0
    @State private var senterHWyVal: CGFloat = 0.0
    @State private var leftHWxVal: CGFloat = 0.0
    @State private var leftHWyVal: CGFloat = 0.0
    @State private var rightHWxVal: CGFloat = 0.0
    @State private var rightHWyVal: CGFloat = 0.0
    @State private var bottomHWxVal: CGFloat = 0.0
    @State private var bottomHWyVal: CGFloat = 0.0
    @State private var topHWxVal: CGFloat = 0.0
    @State private var topHWyVal: CGFloat = 0.0
    @State private var timer = Timer.publish(every: 0.04, on: .main, in: .common).autoconnect()
    var body: some View {
        if !isFinished {
        ZStack {
            Color("BKF")
                .ignoresSafeArea()
            
            
        ZStack {
//            Image("tori1")  //image attached
//                .resizable()
//                .frame(width: 105, height: 105)
//                .aspectRatio(contentMode: .fit)
//                .offset(x: xVal + -106 , y: yVal + -246)
//                .transition(.slide)
//                .padding(200)
//                .onReceive(timer) {_ in
//
//                    if xVal <= 240 {
//                        xVal += 7
//                    }
//                    if yVal <= 240 {
//                        yVal += 7
//                    }
//                }
            
            
            Image("helloworld")
                .resizable( )
                .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 900)
                .offset(x: senterHWxVal + 20 , y: senterHWyVal + -30)
                .opacity(bowAnimation ? 1 : 0)
            Image("helloworld")
                .resizable( )
                .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 900)
                .offset(x: leftHWxVal + -195 , y: leftHWyVal + 360)
                .opacity(bowAnimation ? 1 : 0)
            Image("helloworld")
                .resizable( )
                .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 900)
                .offset(x: rightHWxVal + 240 , y: rightHWyVal + -420 )
                .opacity(bowAnimation ? 1 : 0)
            Image("helloworld")
                .resizable( )
                .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 900)
                .offset(x: bottomHWxVal + 160, y: bottomHWyVal + 270 )
                .opacity(bowAnimation ? 1 : 0)
            Image("helloworld")
                .resizable( )
                .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 900)
                .offset(x: topHWxVal + -120 , y: topHWyVal + -330 )
                .opacity(bowAnimation ? 1 : 0)
                
                
          
            Image("SwiftUI")
                .resizable( )
                //.renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 700, height: 700)
                .offset(x: SwiftUIxVal + -40 , y: SwiftUIyVal)
                .padding(150)
                
                Image("torikago2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .offset(x: torikagoxVal + 140, y: torikagoyVal)
                    .padding(150)
            
            Image("tori1")  //image attached
                .resizable()
                .frame(width: 110, height: 110)
                .aspectRatio(contentMode: .fit)
                .offset(x: torixVal + -231 , y: toriyVal + -371)
                .transition(.slide)
                .padding(360)
                .onReceive(timer) {_ in

                    if torixVal <= 364 {
                        torixVal += 7
                    }
                    if toriyVal <= 364 {
                        toriyVal += 7
                    }
                }
                    
                    
            
              
            
        }
        .onAppear { // 0.3
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.linear(duration: 2)) {
                    bowAnimation.toggle()
                }
                
            } // 2.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                withAnimation {
                    isFinished.toggle()
                }
            }
            
        }
      //  .foregroundColor(.white)
        }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
