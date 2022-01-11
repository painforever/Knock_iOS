//
//  KnockTypesContentView.swift
//  Knock_iOS
//
//  Created by yusong on 1/10/22.
//

import SwiftUI

struct KnockTypesContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var newKnockViewModel: NewKnockContentView.NewKnockViewModel
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Constants.knockTypes, id: \.self) { item in
                    VStack {
                        Image(item).resizable().frame(width: 100, height: 100, alignment: .center)
                        Text(item)
                    }.onTapGesture {
                        newKnockViewModel.knockType = item
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct KnockTypesContentView_Previews: PreviewProvider {
    static var previews: some View {
        KnockTypesContentView(newKnockViewModel: NewKnockContentView.NewKnockViewModel())
    }
}
