//
//  CircleView.swift
//  sample
//
//  Created by cmStudent on 2022/09/01.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        
        Button(action: {
           // timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
               
                    //  }
            

           
        }) {
            Image("soner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            .overlay(
                Circle()
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 10, height: 10)
                           
//                Image(systemName : "wifi")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 30, height: 30)
//                .foregroundColor(.white)
               
            )
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
