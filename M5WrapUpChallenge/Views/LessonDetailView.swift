//
//  LessonDetailView.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/10/22.
//

import SwiftUI
import AVKit

struct LessonDetailView: View {
    @EnvironmentObject var lessonModel: LessonModel
    
    var lesson: Lesson
    
    var body: some View {
        
        VStack{
            if let url = URL(string: lesson.url) {
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
                    .frame(maxHeight: 300)
            }
            Button("Return to Home"){
                lessonModel.gotoHomePage()
            }
        }
        //Text(lesson.url)
    }
}


struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let lessons = LessonModel()
        //let model = AuthorModel()
        //DetailView(thisauthor: model.authors[0])
        
        var lesson = lessons.lessons[1]
        LessonDetailView(lesson: lesson)
    }
}

