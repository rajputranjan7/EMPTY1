//
//  ContentView.swift
//  rr
//
//  Created by student on 04/12/25.
//

import SwiftUI
import SwiftData
struct NotesApp: View {
    
//    Used to perform CRUD operations
    @Environment(\.modelContext)
    private var modelContext
    @Query private var Lists: [Listt]
    
    @State private var title: String = ""
    @State private var isAlertShowing :Bool = false
    var body: some View {
        NavigationStack{
            List{
                    ForEach(Lists) {
                        Lists in
                    Text(Lists.title)
                            .font(.title)
                            .fontWeight(.light)
                            .padding(.vertical,2)
                               }
            }
            .navigationTitle("My list")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    Button{
                        isAlertShowing.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
               
            }
            .alert("create a new view", isPresented:$isAlertShowing){
                TextField("Enter a list:",text:$title)
                Button()
                    {
                        modelContext.insert(Listt(title:title))
                        title = ""
                    } label:{
                        Text("save")
                    }
                    .disabled(title.isEmpty)
            }
            .overlay{
                if Lists.isEmpty{
                    ContentUnavailableView("My lists are not available",
                        systemImage: "heart.circle",
                         description:Text("No List yest, Add one to get Start"))
                    
                }
            }
        }
    }
}
#Preview("Second list"){
    let container = try! ModelContainer(for: Listt.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    let ctx = container.mainContext
        ctx.insert(Listt(title: "swift Coding club"))
        ctx.insert(Listt(title: "swift Coding1 club"))
        ctx.insert(Listt(title: "swift Coding2 club"))



    return NotesApp()
        .modelContainer(container)
}

#Preview("Main list") {
    NotesApp()
        .modelContainer(for: Listt.self,inMemory:true)
}

