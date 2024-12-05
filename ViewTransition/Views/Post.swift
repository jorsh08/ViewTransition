//
//  Post.swift
//  ViewTransition
//
//  Created by Jorge Verdugo on 04/12/24.
//

import SwiftUI

struct Post: View {
    
    let post: PostModel
    @Binding var selectedPost: PostModel?
    
    var body: some View {
        ZStack{
            VStack {
                cover
                Spacer()
            }
            .ignoresSafeArea()
            Button {
                withAnimation(.linear(duration: 0.3)) {
                    selectedPost = nil
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 20)
            .padding(.top, 50)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 600)
        .padding(20)
        .foregroundColor(.white)
        .background(
            Image(post.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: post.namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: post.namespace)
        )
        .overlay(
            VStack  {
                Text(post.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: post.namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView{
                    VStack (alignment: .leading, spacing: 12) {
                        ForEach(post.comments, id: \.self) { comment in
                            Text("\(comment)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer() 
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur", in: post.namespace)
                )
                .offset(y: 410)
        )
    }
}

