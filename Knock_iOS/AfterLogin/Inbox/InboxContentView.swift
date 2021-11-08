//
//  InboxContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI

struct InboxContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { i in
                    MessageCardContentView().background(NavigationLink(destination: ConversationContentView()){})
                }
            }.navigationBarTitle(Text("Inbox"), displayMode: .large)
        }
    }
}

struct InboxContentView_Previews: PreviewProvider {
    static var previews: some View {
        InboxContentView()
    }
}
