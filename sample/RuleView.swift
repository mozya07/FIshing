//
//  RuleView.swift
//  sample
//
//  Created by cmStudent on 2022/09/14.
//

import SwiftUI

struct RuleView: View {
    
    @ObservedObject var sensor = MotionSensor.shared_m
    @ObservedObject var fishdata = FishData.shared
    @ObservedObject var coordinatedata = CoordinateData.coor_shared
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                Image("rule1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule6")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule7")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule8")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
                Image("rule9")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 200)
                    .offset(x: -5)
        
        Button(action: {
            sensor.shakecount = 0
            sensor.resultcount = 0
            fishdata.startfish()
            fishdata.startfish()
            sensor.fishookisa = fishdata.startfishdata
           // print("UUUU" + String(fishookisa)) // 確認用
            coordinatedata.startcoordinate() // 座標の関数呼び出し
            print("SSSSSS：" + "\(sensor.coordinatedata.rh)")
            sensor.fishxVal = sensor.coordinatedata.returncoordinate
            sensor.fishyVal = sensor.coordinatedata.returncoordinatesecond
            
          dismiss()
           
        }) {
            Text("釣りへ戻る")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
                .padding()
                .background(Color.white.cornerRadius(30))
                .frame(width: 300, height: 100)
                .shadow(color: .gray, radius: 3, x: 10, y: 10)
                .offset(x: -5)
        }
        
            }
        }
    } // someview
}

struct RuleView_Previews: PreviewProvider {
    static var previews: some View {
        RuleView()
    }
}
