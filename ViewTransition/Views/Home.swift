//
//  Home.swift
//  ViewTransition
//
//  Created by Jorge Verdugo on 03/12/24.
//

import SwiftUI

struct Home: View {
    
    @State var selectedPost: PostModel? = nil
    @State private var posts: [PostModel] = []
    @Namespace var namespace
    
    init() {
        _posts = State(initialValue: [
            PostModel(id: 1, image: "Image", title: "Title 1", comments: ["Nice photo!", "Love this!", "Amazing!","Nice photo!", "Love this!", "Amazing!", "Nice photo!", "Love this!", "Amazing!", "Nice photo!", "Love this!" ], likes: 12, show: false, namespace: namespace),
            PostModel(id: 2, image: "Image2", title: "Title 2", comments: ["Amazing!", "Great shot!"], likes: 5, show: false, namespace: namespace),
            PostModel(id: 3, image: "Image3", title: "Title 3", comments: ["Stunning!", "Beautiful!"], likes: 21, show: false, namespace: namespace),
            PostModel(id: 4, image: "Image4", title: "Title 4", comments: ["Great vibes!", "Cool shot!"], likes: 8, show: false, namespace: namespace),
            PostModel(id: 5, image: "Image5", title: "Title 5", comments: ["Nice lighting!", "Awesome!"], likes: 14, show: false, namespace: namespace),
            PostModel(id: 6, image: "Image6", title: "Title 6", comments: ["So cool!", "Fantastic!"], likes: 30, show: false, namespace: namespace),
            PostModel(id: 7, image: "Image7", title: "Title 7", comments: ["Wow!", "Incredible!"], likes: 18, show: false, namespace: namespace),
            PostModel(id: 8, image: "Image8", title: "Title 8", comments: ["Looks amazing!", "Great view!"], likes: 25, show: false, namespace: namespace),
            PostModel(id: 9, image: "Image9", title: "Title 9", comments: ["Nice framing!", "Beautiful shot!"], likes: 9, show: false, namespace: namespace),
            PostModel(id: 10, image: "Image10", title: "Title 10", comments: ["Love it!", "Inspiring!"], likes: 11, show: false, namespace: namespace)
        ])
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach($posts) { $post in
                        PostItem(post: post)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.3)) {
                                    print(post)
                                    selectedPost = post
                                }
                            }
                    }
                }
            }
            
            if let selectedPost = selectedPost {
                Post(post: selectedPost, selectedPost: $selectedPost)
            }
        }
    }
}

#Preview {
    Home()
}
