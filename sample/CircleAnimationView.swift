//
//  CircleAnimationView.swift
//  sample
//
//  Created by cmStudent on 2022/09/01.
//

import SwiftUI
import CoreMedia

struct CircleAnimationView : View {
    @ObservedObject var sensor = MotionSensor.shared_m
//    @ObservedObject var coordinatedata = CoordinateData()
    @ObservedObject private var fishdata = FishData.shared
    @State var timer :Timer?
    @State private var shouldAnimation = false
    @State private var circletoggle = true
    @State private var earthxVal: CGFloat = 0.0
    @State private var earthyVal: CGFloat = 0.0
    @State private var angle: CGFloat = 0
        @State private var lastAngle: CGFloat = 0
        @State private var length : CGFloat = 400
    
    
    static var shared_circle = CircleAnimationView()
    
    
    
//    init(sensor: MotionSensor) {
//        self.sensor = sensor
//    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
            Image("bgsoner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 390, height: 390)
                .overlay(
                    VStack {
                Image("earth")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    
                    .clipShape(Circle())
                    .rotationEffect(.degrees(Double(self.angle)))
                               .gesture(DragGesture()
                                   .onChanged{ v in
                                       var theta = (atan2(v.location.x - self.length / 2, self.length / 2 - v.location.y) - atan2(v.startLocation.x - self.length / 2, self.length / 2 - v.startLocation.y)) * 180 / .pi
                                       if (theta < 0) { theta += 360 }
                                       self.angle = theta + self.lastAngle
                                   }
                                   .onEnded { v in
                                       self.lastAngle = self.angle
                                   }
                               )
                    }
                        .offset(x: earthxVal + 44, y: earthyVal + 42)
                )
        
        Button(action: {
            //timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//                self.sensor.viewDidLoad()
                //fishxVal = 100
                  //    }

        }) {
//            Circle()
//                .stroke(Color.green, lineWidth: 25)
//                .frame(width: 20, height: 20)
            Image("soner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 280)// 250
            .overlay(
//                Circle()
//                .stroke(Color.green, lineWidth: 10)
//                .frame(width: 10, height: 10)

                Image(systemName : "location.fill")
                .resizable()
                //.aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(sensor.yh))
                .frame(width: 20, height: 20)
                .foregroundColor(.green)
                //.rotationEffect(.degrees(Double(sensor.yh)))
               
            )
        }
            .overlay(
                   
                ZStack {
                
                    Circle()
                        .stroke(Color.green, lineWidth: 120)
                        .scaleEffect(shouldAnimation ? 0.2 : 0)
                    
                    Circle()
                        .stroke(Color.green, lineWidth: 120)
                        .scaleEffect(shouldAnimation ? 0.3 : 0)
                  
                    Circle()
                        .stroke(Color.green, lineWidth: 120)
                        .scaleEffect(shouldAnimation ? 0.4 : 0)
        
                    Circle()
                        .stroke(Color.green, lineWidth: 120)
                        .scaleEffect(shouldAnimation ? 0.5 : 0)
                      
                    Circle()
                        .stroke(Color.green, lineWidth: 120)
                        .scaleEffect(shouldAnimation ? 0.6 : 0)
                    
                  
                }
                .opacity(shouldAnimation ? 0.0 : 0.6)
                    .animation(
                        Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: false)
                    )
                    .overlay(
                        
                        ZStack {
                            Circle()
//                                .fill(.green)
                                .stroke(Color.green, lineWidth: sensor.fishookisa)
                                .frame(width: sensor.fishookisa, height: sensor.fishookisa)
                           //.opacity(0.9)
                                .offset(x: sensor.fishxVal, y: sensor.fishyVal)
                        }
//                            .opacity(shouldAnimation ? 0.6 : 0)
//                            .animation(
//                                Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: false)
//                            )
                        )
              
            )
            .onAppear {
                self.shouldAnimation = true
                
                self.sensor.viewDidLoad() // 方角の取得呼び出し
                fishdata.startfish() // 魚データ（大きさ）を呼び出している
                sensor.fishookisa = fishdata.startfishdata
               // print("UUUU" + String(fishookisa)) // 確認用
                sensor.coordinatedata.startcoordinate() // 座標の関数呼び出し
                print("SSSSSS：" + "\(sensor.coordinatedata.rh)")
                sensor.fishxVal = sensor.coordinatedata.returncoordinate
                sensor.fishyVal = sensor.coordinatedata.returncoordinatesecond
               
                
            }
            }
        }
    }// some View
    
}

struct CircleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimationView(sensor: MotionSensor())
    }
}
