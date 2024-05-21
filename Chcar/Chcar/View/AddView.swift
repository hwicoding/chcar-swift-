//
//  AddView.swift
//  Chcar
//
//  Created by HWI on 5/21/24.
//

import SwiftUI
import PhotosUI // <<<<<<<<<<

struct AddView: View {
    
    // --- Property ---
    @State var image: UIImage?
    @State var selectedItem: PhotosPickerItem?
    @FocusState var isTextFieldFocused: Bool
    @State var isUpdateAlert: Bool = false
    @State var isDeleteAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    @State var isOn: Bool = true
    
    
    var body: some View {
        Text("내 차 시세 예측")
        Text("차 브랜드 선택")
        Text("차 모델 선택")
        Text("색상 선택")
        Text("생산 년도")
        Text("변속기 유형")
        
        Button {
            isOn.toggle()
                } label: {
                    Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                    Image(systemName: isOn ? "circle" : "checkmark.circle.fill")
                }
        
    }
}

//#Preview {
//    AddView()
//}
