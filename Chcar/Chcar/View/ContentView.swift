//
//  ContentView.swift
//  Chcar
//
//  Created by HWI on 5/16/24.
//

import SwiftUI
import SDWebImageSwiftUI // <<<<<<<<<<

struct ContentView: View {
    
    // --- Property ---
    @State var cars: [CarJSON] = []
    
    var body: some View {
        NavigationView(content: {
            List(content: {
                ForEach(cars, id: \.seq, content: {car in
                    NavigationLink(destination: DetailPage(), label: {
                        CarView(carModel: car)
                    }) // NavigationLink
                }) // ForEach
            }) // List
            .navigationTitle("Chcar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Chcar")
                            .font(.custom("", size: 48))
                            .bold()
                    } // VStack
                } // ToolbarItem
            } // toolbar
        }) // NavigationView
        .onAppear(perform: {
            let queryModel = QueryModel()
            Task{
                cars = try await queryModel.loadData(url: URL(string: "http://localhost:8080/Chcar/JSP/Swift/SelectCar.jsp")!)
            }
            print("도현에몽: \(cars)")
        })
    } // body
} // End

struct CarView: View {
    var carModel: CarJSON
    var body: some View {
        HStack(content: {
            let imageURL = URL(string: "http://localhost:8080/Chcar/images/\(carModel.image)")!
            WebImage(url: imageURL)
                .resizable()
                .scaledToFit()
                .frame(width: 100 ,height: 120)
//                                .clipShape(.circle)
//                                .shadow(radius: 20)
            VStack(alignment: .leading, content: {
                HStack(content: {
                    Text(carModel.brand)
                        .bold()
                        .font(.system(size: 20))
                    Text(carModel.model)
                        .bold()
                        .font(.system(size: 20))
                })
                
                Text("생산연도 : \(carModel.year)년")
                    .font(.system(size: 14))
                Text("주행거리 : \(carModel.km)km")
                    .font(.system(size: 14))
                Text("가격 : \(carModel.price)€")
                    .font(.system(size: 14))
            }) // VStack
        }) // HStack
    }
}

#Preview {
    ContentView()
}
