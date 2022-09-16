//
//  SheetView.swift
//  sample
//
//  Created by cmStudent on 2022/09/08.
//

import SwiftUI

struct SheetView: View {
    
    @ObservedObject private var fishdata = FishData.shared
    @ObservedObject var sensor = MotionSensor.shared_m
    @ObservedObject var coordinatedata = CoordinateData.coor_shared
   
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        if sensor.resultcount == 0 {
            
        
        
        ZStack {
            Image("\(fishdata.fish[fishdata.randomfish][2])")
                .ignoresSafeArea()
            
            
            VStack {
                
                Group {
                Spacer()
                Spacer()
                Spacer()
              
                
            Text("\(sensor.count)")
                Text("\(sensor.resultcount)")
                }
                   
                Text("\(fishdata.fish[fishdata.randomfish][3])")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                
           
                Text("\(fishdata.fish[fishdata.randomfish][4])")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .frame(height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
//                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 5))
                
              
                Text("\(fishdata.fish[fishdata.randomfish][5])")
                    .font(.system(size: 25, weight: .bold, design: .rounded)) .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                
                Spacer()
                   
                
                Button(action: {
                  reset()
                    dismiss()
                }) {
                    Text("釣りへ戻る")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.gray)
                        .padding()
                        .background(Color.white.cornerRadius(30))
                        .frame(width: 300, height: 100)
                        .shadow(color: .gray, radius: 3, x: 10, y: 10)
                }
                
                Spacer()
                
            }
        }
        } else if sensor.resultcount == 1 {
            
            ZStack {
                Image("runawaybg")
                    .ignoresSafeArea()
            VStack {
                
                Text("\(sensor.count)")
                    Text("\(sensor.resultcount)")
            Text("魚に逃げられました。")
                    .font(.system(size: 25, weight: .bold, design: .rounded)) .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
            
            Button(action: {
                reset()
                dismiss()
            }) {
                Text("釣りへ戻る")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(30))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
            }
            }
            }
        } else {
            ZStack {
                Image("errorbg")
                    .ignoresSafeArea()
            VStack {
                Text("大変申し訳ありません。")
            Text("想定外の処理が起こりました。")
                Text("エラー")
                Text("カウント数　：" + "\(sensor.count)")
            
            Button(action: {
                reset()
                dismiss()
            }) {
                Text("釣りへ戻る")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(30))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
            }
            }
            }
        }
        
        
        
       
      
        
        
    }
    
    func reset() {
        sensor.shakecount = 0
        sensor.resultcount = 0
        
        fishdata.startfish()
        sensor.fishookisa = fishdata.startfishdata
       // print("UUUU" + String(fishookisa)) // 確認用
        coordinatedata.startcoordinate() // 座標の関数呼び出し
        print("SSSSSS：" + "\(sensor.coordinatedata.rh)")
        sensor.fishxVal = sensor.coordinatedata.returncoordinate
        sensor.fishyVal = sensor.coordinatedata.returncoordinatesecond
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
