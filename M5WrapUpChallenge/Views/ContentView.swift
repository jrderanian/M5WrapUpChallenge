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
        
        NavigationStack(path: $lessonModel.path) {
            //ScrollView {
            List{
                ForEach(lessonModel.lessons) {lesson in
                    NavigationLink(value: lesson) {
                        VStack(alignment: .leading) {
                            Text(lesson.title)
                                .bold()
                            
                        }
                    }
                    
                }
                
            }.foregroundColor(.brown)
                .navigationTitle("Welcome to Swift")
            .navigationDestination(for: Lesson.self) { lesson in LessonDetailView(lesson: lesson)
                    
            }
            //.frame(maxWidth: .infinity)
            // Found this at https://stackoverflow.com/questions/68093282/remove-top-padding-from-list-in-swiftui
            // expands the list to the parent
            .listStyle(.grouped)
            .onAppear {
              let tableHeaderView = UIView(frame: .zero)
              tableHeaderView.frame.size.height = 1
              UITableView.appearance().tableHeaderView = tableHeaderView
            }
        }
        //.foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LessonModel())
    }
}
