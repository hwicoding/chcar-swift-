//
//  QueryModel.swift
//  Chcar
//
//  Created by HWI on 5/20/24.
//

import Foundation

struct QueryModel{
    // throws 에러걸렸을 때 보낸다.
    func loadData(url: URL) async throws ->[CarJSON]{
        // 튜플로 받겠다.
        let (data, _) = try await URLSession.shared.data(from: url)
        // Decoder 하겠다.
        return try JSONDecoder().decode([CarJSON].self, from: data)
    }
}
