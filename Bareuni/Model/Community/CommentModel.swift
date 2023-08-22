//
//  CommentModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import Foundation

struct Comment: Identifiable {
    var id = UUID()
    var profileImageName: String
    var authorName: String
    var text: String
    var date: Date
}
