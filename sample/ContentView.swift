//
//  ContentView.swift
//  sample
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI
import AudioToolbox

struct ContentView: View {
    @ObservedObject var sensor = MotionSensor.shared_m
    @ObservedObject var soundplayer = SoundPlayer()
    @ObservedObject var fishdata = FishData.shared
    @State var timer :Timer?
    @State var circletoggle = true
    @State var isVibrationOn = false
    var body: some View {
      
        ZStack {
            Color.black
                .frame(width: 390, height: 860)
        VStack {
            
//            Text("\(sensor.xStr)")
//                .foregroundColor(.white)
//            Text("\(sensor.yStr)")
//                .foregroundColor(.white)
//            Text("\(sensor.zStr)")
//                .foregroundColor(.white)
//            Text("\(sensor.hh)")
//            Text("\(sensor.yh)")
//                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
//                    print("シェイクしたよ")
//                }
//
           // Spacer()
            
            CircleAnimationView() // CircleAnimationView(sensor: sensor)
                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in

                    if sensor.shakecount == 0 {
                        print("SSSSSS" + "\(sensor.shakecount)")
                        sensor.start_fishing() // 振った瞬間から後にかけての音の処理呼び出し

                        // if文で同じ方法かをここで処理を実装する
                        // もしtureならばstart_fishing()呼び出す
                        // さらにランダムで何秒後にバイブレーションがなるかを実装する
                        // さらにバイブレーションを止めてあげる
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                self.soundplayer.aftershakingPlay() //
                                print("SSSSSS" + "\(self.sensor.h)")
                                print("SSSSSS" + "\(self.sensor.hh)")
                                print("SSSSSS" + "\(self.sensor.coordinatedata.rh)")
                        //sleep(2)
                                if (self.sensor.hh == self.sensor.coordinatedata.rh) { // 竿を投げた方向と魚のいる方向が一致していれば釣れる
                                    self.sensor.shakecount += 1
                                    print("SSSSSS" + "\(self.sensor.coordinatedata.rh)")
                                    print("SSSSSS竿を投げる方向があっています。")
                                    self.play_fishing() // プレイ中の処理呼び出し
                                    print("SSSSSSプレイ開始。")

                        } else {
                            print("竿を投げる方向が違います。")
                        }
                            } // 遅延
                        } // 遅延
                    } else if sensor.shakecount == 1 {
                        // 釣れたらの処理の実装（関数呼び出し）
                        isVibrationOn = false
                        //sensor.timecount()
                        sensor.finish_fishing() // 釣り上げ処理呼び出し

                    } else {
                        // 理想はここで魚に逃げられましたの処理を実装したい
                        // 釣れなかった処理の実装（関数呼び出し）
                        print("魚に逃げれてしまいました。")
                    }
                                   // print("シェイクしたよ")
                                }
                .sheet(isPresented: $sensor.showingSheet) {
                    SheetView()
                        }

                   
                    Button(action: {
                       // timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            self.sensor.isStarted ? self.sensor.stop() : self.sensor.start()
                                //  }
                       // self.sensor.viewDidLoad()// 値を見るための記述しているが
                        // 他のところで呼び出しているので後で消す
                        
                        if isVibrationOn == false {
                            isVibrationOn = true
                            makeVibrationNoLimit()
                        } else {
                            isVibrationOn = false
                        }
                       
                       
                    }) {
                        self.sensor.isStarted ? Text("STOP") : Text("START")
                    }
            
            
           // Spacer()
            ScrollView(.horizontal) {
                HStack {
                    
                    Spacer(minLength: 27)
                    
                    Button(action: {
                  
                        sensor.ruleshowingSheet = true
                       
                        
                }) {
                    Image("icon1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.orange)
                        .frame(width: 110, height: 110)
                }
                .sheet(isPresented: $sensor.ruleshowingSheet) {
                    RuleView()
                        }
                    
                    Button(action: {
                  
                       
                        
                }) {
                    Image("icon2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.orange)
                        .frame(width: 110, height: 110)
                }
                    
                    Button(action: {
                  
                       
                        
                }) {
                    Image("icon3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.orange)
                        .frame(width: 110, height: 110)
                }
                    
                }// HStack
            } // ScrollView
            
                }
        }
        
 
    } // same view
    
    func play_fishing() { // 本当はここに書くのではなくMotionSensorに書くべきだがバイブレーションがなぜか機能しないのでここに書いている
        print("SSSSSSプレイ中。")
        // プレイ中の処理を実装する
        let vtime = Double.random(in: 1...10) // 遅延処理時間変数
        print("SSSSSS" + "\(vtime)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + vtime) {
            withAnimation {
                print("SSSSSSバイブレーション呼び出し開始")
                self.isVibrationOn = true
                self.makeVibrationNoLimit()
                //self.sensor.count = 0
                self.sensor.timecount()
                self.Failure_fishing()
                print("SSSSSSバイブレーション呼び出し成功")
                
            }
        }
        
    }
    
    func makeVibrationNoLimit() { // 本当はここに書くのではなくMotionSensorに書くべきだがバイブレーションがなぜか機能しないのでここに書いている
        if !isVibrationOn {
            return
        }
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {
            makeVibrationNoLimit()
            sleep(1)
        }
    }

    func Failure_fishing() {
        let fishtime = Double(fishdata.fish[fishdata.randomfish][1]) ?? 0.0

        DispatchQueue.main.asyncAfter(deadline: .now() + fishtime) {
            withAnimation {
                isVibrationOn = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("DeviceDidShakeNotification")
}
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}






