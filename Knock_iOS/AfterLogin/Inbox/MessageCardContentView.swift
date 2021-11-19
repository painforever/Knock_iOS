//
//  SwiftUIView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageCardContentView: View {
    @Binding var knockResponse: KnockResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AnimatedImage(url: URL(string: "https://st3.depositphotos.com/1007566/13175/v/600/depositphotos_131750410-stock-illustration-woman-female-avatar-character.jpg")).resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .padding(.horizontal, 5)
                Text(knockResponse.subject).font(.system(size: 18)).fontWeight(.bold)
            }
            
            HStack {
                
                    
                Text("At Article, we’re all about great style. Think sleek modular sofas, anything-but-basic beds, smart sideboards, and more — all designed with premium quality and comfort in mind.")
            }
        }
        .padding()
    }
}

struct MessageCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        let jsonStr = """
            {
            "id": 19,
            "subject": "That was the best ice-cream soda I ever tasted.",
            "knockee_id": 17,
            "user_id": 18,
            "knock_type": "Romantic",
            "username": "yasfoor",
            "sent_at": "11/18/2021 16:58"
            }
        """
        let json = try! JSONDecoder().decode(KnockResponse.self, from: Data(jsonStr.utf8))
        MessageCardContentView(knockResponse: .constant(json))
    }
}
