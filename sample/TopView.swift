//
//  TopView.swift
//  sample
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct TopView: View {
    
    @ObservedObject var soundplayer = SoundPlayer()
    @State private var topviewFinished = true
    
    var body: some View {
        
        if topviewFinished == true {
        
        ZStack {
            Image("topbga")
                .ignoresSafeArea()
            
            ZStack {
                Button(action: {
                    
                    soundplayer.departurePlay()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            soundplayer.departureStop()
                            topviewFinished.toggle()
                        }
                    }
                   
                }) {
                    Image("topmozi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 2000, height: 1000)
                        .offset(y : 20)
                        .blinkEffect()
                }
            }
            .offset(y: 200)
        }
            
        } else {
            ContentView()
        }
        
       
        
        // Your Base View....
       // NavigationView {
//            ZStack {
//
//                Image("topbg")
//                    .ignoresSafeArea()
//
//                ZStack {
//            NavigationLink(destination: ContentView().navigationBarHidden(true)) {
//                Image("topmozi")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 2000, height: 1000)
//
//
//                       }
//            }
//                 .offset(y: 200)
//
//            }
     //   }
        
      
        
        // Use Overlay since ZStack having issues with animation...
        //.overlay(SplashScreen())
        
    
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}

