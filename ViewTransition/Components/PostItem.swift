//
//  PostItem.swift
//  ViewTransition
//
//  Created by Jorge Verdugo on 04/12/24.
//

import SwiftUI

struct PostItem: View {
    
    let post: PostModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12){
            Spacer()
            HStack {
                Text(post.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: post.namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
            }
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "blur", in: post.namespace)
            )
        }
        .padding(20)
        .foregroundColor(.black)
        .background(
            Image(post.image)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 170)
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: post.namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: post.namespace)
        )
        .frame(height: 170)
        .padding(20)
    }
}

#Preview {
    PostItem(post: PostModel.MOCK_POST)
}

