//
//  ConversationContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI

struct ConversationContentView: View {
    @State var replyPopupShow: Bool = false
    
    var body: some View {
        List {
            ForEach(0..<10) { i in
                MessageCardContentView(isTopic: .constant(false))
            }
        }
        .navigationBarTitle(Text("Conversation with Kunichi Kitajima"), displayMode: .large)
        .navigationBarItems(trailing:
            Button(action: {
                replyPopupShow.toggle()
            }, label: {
                Text("Reply")
                    .foregroundColor(Color(Constants.themeColor))
            }).sheet(isPresented: $replyPopupShow) {
                PopupInputContentView()
            })
    }
}

struct ConversationContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationContentView()
    }
}
