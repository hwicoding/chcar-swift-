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
                    NavigationLink(destination: DetailPage(cars: car), label: {
                        CarView(carModel: car)
                        
                    }) // NavigationLink
                }) // ForEach
            }) // List
//            .environment(\.listRowInsets)
            .listStyle(.automatic)
//            .navigationTitle("Chcar")
//            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading, content: {
                        HStack(content: {
                            Image("logo_green")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            NavigationLink(destination: AddView(), label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 10))
                                    .frame(width:36, height: 36)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(10)
                                    .padding(.leading, 160)
                            }) // NavigationLink
                        }) // HStack
                    }) // VStack
                } // ToolbarItem
            } // toolbar
        }) // NavigationView
        .onAppear(perform: {
            let queryModel = QueryModel()
            Task{
                cars = try await queryModel.loadData(url: URL(string: "http://localhost:8080/Chcar/JSP/Swift/SelectCar.jsp")!)
            }
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
