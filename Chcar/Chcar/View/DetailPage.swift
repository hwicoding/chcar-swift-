//
//  DetailPage.swift
//  Chcar
//
//  Created by HWI on 5/16/24.
//

import SwiftUI
import SDWebImageSwiftUI // <<<<<<<<<<

struct DetailPage: View {
    
    // --- Property ---
    @State var cars: CarJSON
    @State var image: UIImage?
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        let imageURL = URL(string: "http://localhost:8080/Chcar/images/\(self.cars.image)")!
                    
            Spacer()
            
            WebImage(url: imageURL)
                .font(.system(size: 60))
                .frame(width: 150, height: 100)
            
            Spacer()
            
            Text("가격 : \(cars.price)€")
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            
            Spacer()
            
            HStack(content: {
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("브랜드")
                    Text(cars.brand)
                        .bold()
                        .font(.system(size: 30))
                })
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("모델")
                    Text(cars.model)
                        .bold()
                        .font(.system(size: 30))
                })
                
                Spacer()
            })
            
            Spacer()
            
            HStack(content: {
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("연식")
                    Text("\(cars.year)년")
                        .bold()
                        .font(.system(size: 20))
                })
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("색상")
                    Text(cars.color)
                        .bold()
                        .font(.system(size: 20))
                })
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("주행거리")
                    Text("\(cars.km)km")
                        .bold()
                        .font(.system(size: 20))
                })
                
                Spacer()
            })
            
            Spacer()
            
            HStack(content: {
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("연료 유형")
                    Text(cars.fuel)
                        .bold()
                        .font(.system(size: 20))
                }) // VStack
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("변속기 유형")
                    Text(cars.transmission)
                        .bold()
                        .font(.system(size: 20))
                }) // VStack
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("연비")
                    Text("\(cars.efficiency)100km/h")
                        .bold()
                        .font(.system(size: 20))
                }) // VStack
                
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("마력")
                    Text("\(cars.ps)HP")
                        .bold()
                        .font(.system(size: 20))
                }) // VStack
                
                Spacer()
                
            }) // HStack
            .navigationTitle("Detail View")
            .navigationBarTitleDisplayMode(.inline)

            
            Spacer()
            
    }
    
    //#Preview {
    //    DetailPage(cars: CarJSON)
    //}
}
