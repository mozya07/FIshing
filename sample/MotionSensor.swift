//
//  MotionSensor.swift
//  sample
//
//  Created by cmStudent on 2022/08/30.
//
import SwiftUI
import Foundation
import UIKit
import CoreMotion
import CoreLocation
import AudioToolbox
class MotionSensor: UIViewController ,CLLocationManagerDelegate, ObservableObject {
    
    // 方角関連変数開始
    //@ObservedObject var directiondata = DirectionData()
    @ObservedObject var directionmanager = DirectionManager()
    @ObservedObject var coordinatedata = CoordinateData.coor_shared
    @ObservedObject var soundplayer = SoundPlayer()
    @ObservedObject private var fishdata = FishData.shared
    @Published var h :String = "方角" // 方角の変数
    @Published var hh :String = "" // 方角名変数
    @Published var yh : Double = 0.0 // 矢印の向き変数
    var myLocationManager:CLLocationManager?
    var myHedingLabel:UILabel! // 方角表示用のラベル.
    // 方角関連変数終了
    
    // 加速度センサー関連の変数
    @Published var isStarted = false
    @Published var xStr = 0.0
    @Published var yStr = 0.0
    @Published var zStr = 0.0
    // 加速度センサー関連の変数
    
    // シェイク変数
    @Published var shakecount = 0
    @Published var resultcount = 0
    @State var timer :Timer?
    @Published var count : Double = 0

    
    // シート変数
    @Published var showingSheet : Bool = false
    @Published var ruleshowingSheet : Bool = false
    
    // バイブレーション変数
    @State var isVibrationOn = false
    
    // 魚関連
    @Published var fishxVal: CGFloat = 0.0
    @Published var fishyVal: CGFloat = 0.0
    @Published var fishookisa: Double = 0.0
    
    static var shared_m = MotionSensor()
    

    
    // 方角関連の処理開始
    override func viewDidLoad() {
    super.viewDidLoad()

    // 現在地の取得.
    myLocationManager = CLLocationManager()
    myLocationManager?.delegate = self
    myLocationManager?.requestWhenInUseAuthorization()

    // 方角表示用のラベルを生成.
    myHedingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
    myHedingLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height/2+100)

    myHedingLabel.text = "myHedingLabel"

    self.view.addSubview(myHedingLabel)

    // セキュリティ認証のステータスを取得.
    let status = CLLocationManager.authorizationStatus() // 使われているのか？

    // まだ認証が得られていない場合は、認証ダイアログを表示.
    if(status == CLAuthorizationStatus.notDetermined) {
    print("didChangeAuthorizationStatus:(status)");
    // まだ承認が得られていない場合は、認証ダイアログを表示.
    self.myLocationManager?.requestAlwaysAuthorization()
    }

    myLocationManager?.headingFilter = kCLHeadingFilterNone // 何度動いたら更新するか（デフォルトは1度）
    myLocationManager?.headingOrientation = .portrait
    myLocationManager?.startUpdatingHeading()
    }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

    //---

    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("locationManager");

    // 方角の表示.
    myHedingLabel.text = "方角".appendingFormat("%.2f", newHeading.magneticHeading) // これは後で消す（使っていない処理）
        h = "方角".appendingFormat("%.2f", newHeading.magneticHeading) // 取得した方角を変数（h）へ代入
        h.removeLast(3) //引数に削除する文字数を指定 ＝　小数点部分を削除している
        h.removeFirst(2) // 方角の部分を削除している
        // 方角の値（String）をもてくる処理
        (hh , yh) = directionmanager.directionResult(result: h)
        
        myHedingLabel.textAlignment = NSTextAlignment.center

    }
    
   

    // 位置情報取得に失敗した時に呼び出されるデリゲート.
    func locationManager(_ manager: CLLocationManager,didFailWithError error: Error){
    print("error")
    }
    
    // 方角ストップ処理
    func stopviewDidLoad() {
        myLocationManager?.stopUpdatingHeading()
    }
    // 方角関連の処理終了
    
    
    // 加速度センサー関連の処理
    let motionManager = CMMotionManager()
    
    func start() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (motion:CMAccelerometerData?, error:Error?) in
                self.updateMotionData(motionData: motion!)
            }
        }
        
        isStarted = true
    }
    
    func stop() {
        isStarted = false
        motionManager.stopAccelerometerUpdates()
    }
    
    private func updateMotionData(motionData:CMAccelerometerData) {
        xStr = motionData.acceleration.x
        yStr = motionData.acceleration.y
        zStr = motionData.acceleration.z
        //zStr = String(motionData.acceleration.z)
    }
    // 加速度センサー関連の処理
    
    func start_fishing() {
        // シェイクで竿を投げた時の処理を実装する
        
        
        print("SSSSSS" + "\(shakecount)")
        self.soundplayer.secondstrongPlay() // このままでいい
        
       // self.viewDidLoad() // 方角の取得呼び出し
        print("SSSSSS" + "\(self.h)")
        print("SSSSSS" + "\(self.hh)")
        print("SSSSSS" + "\(self.coordinatedata.rh)")
        
   
    }
    
//func play_fishing() {
//        print("SSSSSSプレイ中。")
//        // プレイ中の処理を実装する
//        let vtime = Double.random(in: 1...20) // 遅延処理時間変数
//       print("SSSSSS" + "\(vtime)")
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + vtime) {
//            withAnimation {
//                print("SSSSSSバイブレーション呼び出し開始")
//                self.isVibrationOn = true
//                print("SSSSSSバイブレーション呼び出し成功")
             //timecount()
//            }
//        }
        
    //}
    
    func finish_fishing() {
        // 釣り上げの処理を実装する
        //let fishtime = Double(fishdata.fish[fishdata.randomfish][1]) ?? 0.0
//        var fishtime : Double = 0.0
//        fishtime = Double(fishdata.fish[fishdata.randomfish][1]) ?? 0.0
        let fishtime = Double(fishdata.fish[fishdata.randomfish][1]) ?? 0.0
        print("COUNT1" + "\(self.count)")
        
        if self.count > fishtime {
            resultcount += 1
            print("COUNT2" + "\(self.count)")
       }
        
     //   if count <= fishtime { // 秒数以内に竿を上げた処理（釣り上げ成功処理）
            // ここでシートを表示する処理を実装
            showingSheet = true // シート表示
      //  }
    
        // バイブレーションの音がしてから何秒いないに竿をあげないと魚が釣れないという処理
        
    }
    
    func timecount() { // 何秒以内を表す処理
        
        var countn = 0
        
        if countn == 0 {
            
            print("COUNT3" + "\(count)")
            
            //init(timeInterval: TimeInterval, invocation: NSInvocation, repeats: Bool)
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in // falseにすれば止まるかも
                self.count += 0.1
                print("COUNT4" + "\(self.count)")
                            }
        } else {
            self.count = 0
        }
        count += 1
        // 毎秒＋１する処理
      
        
       
        
        
       
        
       
    }
    
        
        func reelPlay() {
            if (xStr >= 1 || xStr >= 0.9) {
                // ここでリールを巻く処理を実装する
            }
        }
    
    

    
}

