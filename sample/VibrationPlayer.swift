//
//  VibrationPlayer.swift
//  sample
//
//  Created by cmStudent on 2022/09/08.
//

import SwiftUI
import AudioToolbox


class VibrationPlayer : ObservableObject {
    
    //let generator = UINotificationFeedbackGenerator()
    @State var isVibrationOn = false
    
    
    func vibrationplay() {
        isVibrationOn = true
        print("SSSSSS" + "true")
        makeVibrationNoLimit()
    }
    
    func vibrationstop() {
        isVibrationOn = false
    }
    
    func makeVibrationNoLimit() {
        if !isVibrationOn {
            return
        }
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {
            self.makeVibrationNoLimit()
            sleep(1)
        }
    }
    
}
