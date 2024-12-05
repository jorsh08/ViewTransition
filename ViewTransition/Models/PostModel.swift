//
//  PostModel.swift
//  ViewTransition
//
//  Created by Jorge Verdugo on 04/12/24.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable{
    let id: Int
    let image: String
    let title: String
    let comments: [String]
    var likes: Int
    var show: Bool
    let namespace: Namespace.ID
}

extension PostModel {
    @Namespace static var namespace
    static let MOCK_POST = PostModel(id: 1, image: "Image", title: "Verdugo", comments: ["jorge08", "test"], likes: 11, show: false, namespace: namespace)
}

