//
//  SwiftUIView.swift
//  Knock_iOS
//
//  Created by yusong on 11/22/21.
//

import SwiftUI

struct Post: Codable {
    let id: Int
    let title: String
}

struct SwiftUIView: View {
    //var posts: [Post] = PreviewJSON.loadList(name: "posts")
    var post: Post
    //https://jsonplaceholder.typicode.com/todos/1
    //https://jsonplaceholder.typicode.com/todos/
    var body: some View {
        VStack {
            Text(post.title)
        }
//        List(posts, id: \.id) { post in
//            Text(post.title)
//        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(post: PreviewJSON.loadObject(name: "post")!)
    }
}
