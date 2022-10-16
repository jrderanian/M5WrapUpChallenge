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
            
            // to run locally...
           // let urlPath = "/Users/drano/Downloads/L5ChallengeAssets"
            //let thisVideo = urlPath + "/Lesson \(lesson.id)"
            //VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video", withExtension: "mp4")!))
              //  .frame(height: 400)
            Text(lesson.title).font(.title)
            
            // run from local resource
            if let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Lesson \(lesson.id)", ofType: "mp4")!){
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
                    .frame(maxHeight: 300)
            }
            
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
        //Text(lesson.url)
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

