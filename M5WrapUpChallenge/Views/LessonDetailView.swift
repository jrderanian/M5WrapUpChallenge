//
//  LessonDetailView.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/10/22.
//

import SwiftUI

struct LessonDetailView: View {
    
    var lesson: Lesson
    var body: some View {
        Text(lesson.url)
    }
}

/*
struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        var lesson = Lesson
        LessonDetailView(lesson: <#T##Lesson#>)
    }
}
*/
