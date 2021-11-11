//
//  SwiftUIView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageCardContentView: View {
    @Binding var isTopic: Bool
    
    var body: some View {
        VStack {
            if isTopic {
                Text("Someone wants to knock you, reply to him!").font(.system(size: 18)).fontWeight(.bold)
            }
            HStack {
                AnimatedImage(url: URL(string: "https://st3.depositphotos.com/1007566/13175/v/600/depositphotos_131750410-stock-illustration-woman-female-avatar-character.jpg")).resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .padding(.horizontal, 5)
                    
                Text("At Article, we’re all about great style. Think sleek modular sofas, anything-but-basic beds, smart sideboards, and more — all designed with premium quality and comfort in mind.")
            }
        }
        .padding()
    }
}

struct MessageCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCardContentView(isTopic: .constant(true))
    }
}
