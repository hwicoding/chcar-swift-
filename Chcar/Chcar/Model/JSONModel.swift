//
//  TodoList.swift
//  Chcar
//
//  Created by HWI on 5/20/24.
//

import Foundation

struct CarJSON: Decodable{
    let image: String
    let efficiency: String
    let km: String
    let transmission: String
    let ps: String
    let color: String
    let year: String
    let fuel: String
    let price: String
    let model: String
    let brand: String
    let seq: String
}

// Key값 만들어주기(seq를 key값으로)
extension CarJSON: Hashable{
    func hash(into hasher: inout Hasher) {
        // hasher에다가 value를 넣음
        hasher.combine(seq)
    }
}
