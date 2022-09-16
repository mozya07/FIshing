//
//  FishingManager.swift
//  sample
//
//  Created by cmStudent on 2022/09/05.
//

import SwiftUI

class FishingManager : ObservableObject {
    
    let soundPlayer = SoundPlayer()
    @ObservedObject var sensor = MotionSensor.shared_m
    
    @State var saocount: Int = 0
    
    func startfishing() {
        
        // 竿を投げた時の処理
        // １秒間の遅延処理
        saocount = saocount + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if self.sensor.hh == "ボタンの方角" {
            print("1秒経ちました。")
            self.soundPlayer.secondstrongPlay()
            }
        }
        
        
    }
    
    func plyafishing() {
        // 釣り中の処理
    }
    
    func finishfishing() {
        // 竿を引き上げた時の処理
    }
    
    func reelplay() {
        // リールを巻く処理
    }
    
    func resetfishing() {
        // リセット処理
        saocount = 0
    }
}
