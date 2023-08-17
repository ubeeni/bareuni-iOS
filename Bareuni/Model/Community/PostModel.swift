//
//  PostModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    var content: String
    var modificationTime: String
    var likeCount: Int
    var comments: Int
    var isLiked: Bool
}
