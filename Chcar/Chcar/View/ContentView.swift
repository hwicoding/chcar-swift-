//
//  ContentView.swift
//  Chcar
//
//  Created by HWI on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    
    // --- Property ---
    @ State var carInfo: [CarInfo] = [
        CarInfo(image: "hyundai_tucson_01", brand: "현대", model: "투싼", year: 2017, km: 20000, price: 2000),
        CarInfo(image: "hyundai_tucson_02", brand: "현대", model: "투싼", year: 2018, km: 30000, price: 3000),
    ]
    
    var body: some View {
        
        NavigationView(content: {
            List(carInfo, rowContent: {carinfo in
                
                // Row
                HStack(content: {
                    Image(carinfo.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                    
                    // Colmn
                    VStack(alignment: .leading, content: {
                        // Row
                        HStack(content: {
                            Text(carinfo.brand)
                                .font(.system(size: 20))
                                .bold()
                            Text(carinfo.model)
                                .font(.system(size: 20))
                                .bold()
                        }) // HStack
                        
                        Text("생산년도 : \(carinfo.year)")
                            .font(.system(size: 12))
                        Text("주행거리 : \(carinfo.km)km")
                            .font(.system(size: 12))
                        Text("가격 : \(carinfo.price)€")
                            .font(.system(size: 12))
                        
                    }) // VStack
                }) // HStack
            }) // List
            .navigationTitle("ChCar")
            .navigationBarTitleDisplayMode(.inline)
        }) // NavigationView
    } // body
} // End

#Preview {
    ContentView()
}
