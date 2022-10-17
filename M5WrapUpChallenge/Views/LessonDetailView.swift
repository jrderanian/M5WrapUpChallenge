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
    //let aspectRatio: CGFloat = 478 / 849
    
    var body: some View {
        
        VStack{
            
            Text(lesson.title).font(.title)
            
            // run from local resource, no access to internet
            
            // Original Code I used for VideoPlayer
            
            if let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Lesson \(lesson.id)", ofType: "mp4")!){
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
                    .frame(maxHeight: 300)
            }
            
            // too big on a 12 mini sideways with recommended solution
            /*
            if let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Lesson \(lesson.id)", ofType: "mp4")!){
                GeometryReader { geo in
                    VideoPlayer(player: AVPlayer(url: url))
                        .cornerRadius(10)
                        .frame(height: geo.size.width * aspectRatio)
                }
            }
            */
            
            // run from remote server
            /*
            if let url = URL(string: lesson.url) {
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
                    .frame(maxHeight: 300)
            }
            */
            Button("Return to Home"){
                lessonModel.gotoHomePage()
            }
        }
    }
}


struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let lessons = LessonModel()
        //let model = AuthorModel()
        //DetailView(thisauthor: model.authors[0])
        
        let lesson = lessons.lessons[1]
        LessonDetailView(lesson: lesson)
    }
}

