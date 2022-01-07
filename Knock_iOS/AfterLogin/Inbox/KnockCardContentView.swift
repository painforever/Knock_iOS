//
//  SwiftUIView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct KnockCardContentView: View {
    @Binding var knockResponse: KnockResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AnimatedImage(url: URL(string: knockResponse.avatar)).resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .padding(.horizontal, 5)
                Text(knockResponse.username).fontWeight(.bold).font(.system(size: 20))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(knockResponse.subject).font(.system(size: 18)).fontWeight(.bold)
                Text(knockResponse.firstMessage)
            }
        }.padding()
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
                "knock_id": 19,
                "knock_type": "Romantic",
                "username": "yasfoor",
                "sent_at": "11/18/2021 16:58",
                "message": "I believe that the purpose of life is, at least in part, to be happy. Based on this belief, Ruby is designed to make programming not only easy but also fun. It allows you to concentrate on the creative side of programming, with less stress."
            }
        """
        let json = try! JSONDecoder().decode(KnockResponse.self, from: Data(jsonStr.utf8))
        KnockCardContentView(knockResponse: .constant(KnockResponse(id: 19, knockId: 19, userId: 18, knockType: "Romantic", subject: "That was the best ice-cream soda I ever tasted.", knockeeId: 17, username: "yasfoor", sentAt: "11/18/2021 16:58", firstMessage: "I believe that the purpose of life is, at least in part, to be happy. Based on this belief, Ruby is designed to make programming not only easy but also fun. It allows you to concentrate on the creative side of programming, with less stress.", avatar: "https://st3.depositphotos.com/1007566/13175/v/600/depositphotos_131750410-stock-illustration-woman-female-avatar-character.jpg")))
    }
}
