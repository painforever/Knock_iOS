//
//  KnockMessageCardContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/19/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct KnockMessageCardContentView: View {
    @Binding var knockMessageResponse: KnockMessageResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AnimatedImage(url: URL(string: knockMessageResponse.senderAvatar)).resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .padding(.horizontal, 5)
                Text(knockMessageResponse.senderUsername).font(.system(size: 18)).fontWeight(.bold)
            }
            
            HStack {
                Text(knockMessageResponse.message)
            }
        }
        .padding()
    }
}

struct KnockMessageCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        let jsonStr = """
            {
            "id": 10,
            "user_id": 18,
            "knock_id": 7,
            "sender_username": "yasfoor",
            "message": "The orthogonal features, when combined, can explode into complexity.",
            "sent_at": "1 day",
            "sender_avatar": "https://knock-avatar.s3.amazonaws.com/uploads/user/s3_avatar_photo/18/86C8E461-DD40-479E-A136-438D642CA60D.jpeg",
            "sender_fullname": "Yahya Asfoor"
            }
        """
        let json = try! JSONDecoder().decode(KnockMessageResponse.self, from: Data(jsonStr.utf8))
        KnockMessageCardContentView(knockMessageResponse: .constant(json))
    }
}
