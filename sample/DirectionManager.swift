//
//  DirectionManager.swift
//  sample
//
//  Created by cmStudent on 2022/09/02.
//

import SwiftUI

class DirectionManager : ObservableObject {
    
    @ObservedObject var directiondata = DirectionData()
    var hresult :String = ""
    var yresult : Double = 0.0
    
    func directionResult(result: String) -> (String, Double) {
        for hnumber in directiondata.walkNorth {
            if result == hnumber {
                hresult = "北"
                yresult = 315.0
            }
        }
        
        for hnumber in directiondata.walkNNE {
            if result == hnumber {
                hresult = "北北東"
                yresult = 337.5
            }
        }
        
        for hnumber in directiondata.walkNE {
            if result == hnumber {
                hresult = "北東・東北"
                yresult = 0.0
            }
        }
        
        for hnumber in directiondata.walkNEE {
            if result == hnumber {
                hresult = "北東東"
                yresult = 22.5
            }
        }
        
        for hnumber in directiondata.walkEast {
            if result == hnumber {
                hresult = "東"
                yresult = 45.0
            }
        }
        
        for hnumber in directiondata.walkEES {
            if result == hnumber {
                hresult = "東東南"
                yresult = 67.5
            }
        }
        
        for hnumber in directiondata.walkES {
            if result == hnumber {
                hresult = "東南・南東"
                yresult = 90.0
            }
        }
        
        for hnumber in directiondata.walkESS {
            if result == hnumber {
                hresult = "東南南"
                yresult = 112.5
            }
        }
        
        for hnumber in directiondata.walkSouth {
            if result == hnumber {
                hresult = "南"
                yresult = 135.0
            }
        }
        
        for hnumber in directiondata.walkSSW {
            if result == hnumber {
                hresult = "南南西"
                yresult = 157.5
            }
        }
        
        for hnumber in directiondata.walkSW {
            if result == hnumber {
                hresult = "南西・西南"
                yresult = 180.0
            }
        }
        
        for hnumber in directiondata.walkSWW {
            if result == hnumber {
                hresult = "南西西"
                yresult = 202.5
            }
        }
        
        for hnumber in directiondata.walkWest {
            if result == hnumber {
                hresult = "西"
                yresult = 225.0
            }
        }
        
        for hnumber in directiondata.walkWWN {
            if result == hnumber {
                hresult = "西西北"
                yresult = 247.5
            }
        }
        
        for hnumber in directiondata.walkWN {
            if result == hnumber {
                hresult = "西北・北西"
                yresult = 270.0
            }
        }
        
        for hnumber in directiondata.walkWNN {
            if result == hnumber {
                hresult = "西北北"
                yresult = 292.5
            }
        }
        return (hresult, yresult)
    }
}

