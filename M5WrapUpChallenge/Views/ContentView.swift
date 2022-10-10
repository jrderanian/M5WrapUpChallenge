//
//  ContentView.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var lessonModel: LessonModel
    
    var body: some View {
        VStack {
            
            NavigationStack(path: $lessonModel.path) {
                        List{
                            //Section("Lessons") {
                                ForEach(lessonModel.lessons) {lesson in
                                    NavigationLink(value: lesson) {
                                        VStack(alignment: .leading) {
                                            Text(lesson.title)
                                        }
                                    }
                                    
                                }
                                
                           // }
                            
                            
                        }
                        .navigationDestination(for: Lesson.self) { lesson in LessonDetailView(lesson: lesson)
                        }
                    }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LessonModel())
    }
}
