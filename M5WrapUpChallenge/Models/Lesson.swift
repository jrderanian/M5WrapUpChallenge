//
//  Lesson.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/9/22.
//

import Foundation

struct Lesson: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var video: String
    
}
