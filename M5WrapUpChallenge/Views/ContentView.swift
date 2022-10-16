//
//  ContentView.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/9/22.
//
// this is close https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data
// for add the searchable to the navigation

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var lessonModel: LessonModel
    
    @State private var isEditing = false
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack(path: $lessonModel.path) {
            //Button("Go search") { lessonModel.path.append(lessonModel.lessons[4]) }
            List {
                ForEach(lessonModel.lessons) { lesson in
                    //ForEach(searchResults, id: \.self) { lesson in
                    NavigationLink(value: lesson) {
                        VStack(alignment: .leading) {
                            Text(lesson.title)
                                .bold()
                        }
                    }
                }
            }
            .foregroundColor(.brown)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
                ForEach(searchResults, id: \.self) { result in
                    Button("\(result)", action: {
                        if let lesson = lessonModel.lessonByTitle[result]{
                            lessonModel.path.append(lesson)
                        }
                    }).foregroundColor(.brown)
                }
            }
            .navigationTitle("Welcome to Swift")
            .navigationDestination(for: Lesson.self) { lesson in LessonDetailView(lesson: lesson)
            }
            // Found this at https://stackoverflow.com/questions/68093282/remove-top-padding-from-list-in-swiftui
            // expands the list to the parent
            .listStyle(.grouped)
            .onAppear {
                let tableHeaderView = UIView(frame: .zero)
                tableHeaderView.frame.size.height = 1
                UITableView.appearance().tableHeaderView = tableHeaderView
            }
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return lessonModel.titles
        } else {
            return lessonModel.titles.filter { $0.contains(searchText) }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            //SearchBar(text: .constant(""))
            //ContentView().environmentObject(LessonModel())
            ContentView().environmentObject(LessonModel())
        }
    }
}
