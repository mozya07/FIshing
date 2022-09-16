//
//  CoordinateData.swift
//  sample
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

class CoordinateData : ObservableObject {
    
    // 座標
    @Published var randomcoordinate: Int = 0
    @Published var returncoordinate: Double = 0.0
    @Published var returncoordinatesecond: Double = 0.0
    
    @Published var rh: String = ""
    
    static var coor_shared = CoordinateData()
    
    let coordinate:[[Double]] = [[0, 20], [-20, 0], [0, -20], [20, 0],
                                 [-17, 17], [-17, -17], [17, -17], [17, 17],
                                 [0, 60], [-60, 0], [0, -60], [60, 0],
                                 [-43, 43], [-43, -43], [43, -43], [43, 43],
                                 [0, 90], [-90, 0], [0, -90], [90, 0],
                                 [-70, 70], [-70, -70], [70, -70], [70, 70],]
    
    func startcoordinate() {
        randomcoordinate = Int.random(in: 0...23)
        returncoordinate = coordinate[randomcoordinate][0]
        returncoordinatesecond = coordinate[randomcoordinate][1]
        
        directionjudge()
    }
    
    func directionjudge() {
        if randomcoordinate == 2 || randomcoordinate == 10 || randomcoordinate == 18 {
            rh = "北"
        } else if randomcoordinate == 6 || randomcoordinate == 14 || randomcoordinate == 22 {
            rh = "北東・東北"
        } else if randomcoordinate == 3 || randomcoordinate == 11 || randomcoordinate == 19 {
            rh = "東"
        } else if randomcoordinate == 7 || randomcoordinate == 15 || randomcoordinate == 23 {
            rh = "東南・南東"
        } else if randomcoordinate == 0 || randomcoordinate == 8 || randomcoordinate == 16 {
            rh = "南"
        } else if randomcoordinate == 4 || randomcoordinate == 12 || randomcoordinate == 20 {
            rh = "南西・西南"
        } else if randomcoordinate == 1 || randomcoordinate == 9 || randomcoordinate == 17 {
            rh = "西"
        } else if randomcoordinate == 5 || randomcoordinate == 13 || randomcoordinate == 21 {
            rh = "西北・北西"
        }
    }
}
