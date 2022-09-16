//
//  SoundPlayer.swift
//  sample
//
//  Created by cmStudent on 2022/08/30.
//

import UIKit
import AVFoundation
import SwiftUI

class SoundPlayer: NSObject, ObservableObject {
    
    //釣り竿音１開始
    let firststrongData = NSDataAsset(name: "1")!.data
    
    var firststrongPlayer: AVAudioPlayer!
    
    func firststrongPlay() {
        do {
        
            firststrongPlayer = try AVAudioPlayer(data: firststrongData)
        
            firststrongPlayer.play()
        } catch {
            print("釣り竿音１で、エラーが発生しました！")
        }
    }
    
    func firststrongStop() {
        do {
        
            firststrongPlayer = try AVAudioPlayer(data: firststrongData)
        
            firststrongPlayer.stop()
        } catch {
            print("釣り竿音１で、エラーが発生しました！")
        }
    }
    //釣り竿音１終了
    
    //釣り竿音２開始
    let secondstrongData = NSDataAsset(name: "2")!.data
    
    var secondstrongPlayer: AVAudioPlayer!
    
    func secondstrongPlay() {
        do {
        
            secondstrongPlayer = try AVAudioPlayer(data: secondstrongData)
        
            secondstrongPlayer.play()
        } catch {
            print("釣り竿音２で、エラーが発生しました！")
        }
    }
    
    func secondstrongStop() {
        do {
        
            secondstrongPlayer = try AVAudioPlayer(data: secondstrongData)
        
            secondstrongPlayer.stop()
        } catch {
            print("釣り竿音２で、エラーが発生しました！")
        }
    }
    //釣り竿音２終了
    
    //釣り竿音３開始
    let thirdstrongData = NSDataAsset(name: "3")!.data
    
    var thirdstrongPlayer: AVAudioPlayer!
    
    func thirdstrongPlay() {
        do {
        
            thirdstrongPlayer = try AVAudioPlayer(data: thirdstrongData)
        
            thirdstrongPlayer.play()
        } catch {
            print("釣り竿音３で、エラーが発生しました！")
        }
    }
    
    func thirdstrongStop() {
        do {
        
            thirdstrongPlayer = try AVAudioPlayer(data: thirdstrongData)
        
            firststrongPlayer.stop()
        } catch {
            print("釣り竿音３で、エラーが発生しました！")
        }
    }
    //釣り竿音３終了
    
    //食べる音開始
    let eatData = NSDataAsset(name: "paku")!.data
    
    var eatPlayer: AVAudioPlayer!
    
    func eatPlay() {
        do {
        
            eatPlayer = try AVAudioPlayer(data: eatData)
        
            eatPlayer.play()
        } catch {
            print("食べる音で、エラーが発生しました！")
        }
    }
    
    func eatStop() {
        do {
        
            eatPlayer = try AVAudioPlayer(data: eatData)
        
            eatPlayer.stop()
        } catch {
            print("食べる音で、エラーが発生しました！")
        }
    }
    //食べる音終了
    
    //出航音開始
    let departureData = NSDataAsset(name: "スタート音")!.data
    
    var departurePlayer: AVAudioPlayer!
    
    func departurePlay() {
        do {
        
            departurePlayer = try AVAudioPlayer(data: departureData)
        
            departurePlayer.play()
        } catch {
            print("出航音で、エラーが発生しました！")
        }
    }
    
    func departureStop() {
        do {
        
            departurePlayer = try AVAudioPlayer(data: departureData)
        
            departurePlayer.stop()
        } catch {
            print("出航音で、エラーが発生しました！")
        }
    }
    //出航音終了
    
    
    //竿を振った後の音音開始
    let aftershakingData = NSDataAsset(name: "竿を振った後の音")!.data
    
    var aftershakingPlayer: AVAudioPlayer!
    
    func aftershakingPlay() {
        do {
        
            aftershakingPlayer = try AVAudioPlayer(data: aftershakingData)
        
            aftershakingPlayer.play()
        } catch {
            print("竿を振った後の音音で、エラーが発生しました！")
        }
    }
    
    func aftershakingStop() {
        do {
        
            aftershakingPlayer = try AVAudioPlayer(data: aftershakingData)
        
            aftershakingPlayer.stop()
        } catch {
            print("竿を振った後の音音で、エラーが発生しました！")
        }
    }
    //竿を振った後の音音終了
  

}

