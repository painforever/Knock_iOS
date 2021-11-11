//
//  PopupInputContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/10/21.
//

import SwiftUI

struct PopupInputContentView: View {
    @State var content: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
            VStack {
                TextField("Saying something...", text: $content).modifier(ThemeTextField())
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Submit").themeButton(height: 50)
                })
            }
        }
    }
}

struct PopupInputContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopupInputContentView()
    }
}
