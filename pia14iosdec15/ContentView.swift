//
//  ContentView.swift
//  pia14iosdec15
//
//  Created by BillU on 2025-12-15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    //@Query(sort: \Todo.todotext) private var todoitems: [Todo]
    
    @Query private var todoitems: [Todo]
    
    /*
    @Query(filter: #Predicate<Todo> { todo in
        todo.tododone == false
    }) private var todoitems: [Todo]
    */
    
    @State var addtodo = ""
    @State var adddate = false
    @State var adddatevalue = Date()
    
    @State var showdone = false
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoitems[index])
            }
        }
    }
    
    func filterdone() {
        //_todoitems = Query(filter: #Predicate { $0.tododone == false } )
    }
    
    var body: some View {
        
        VStack {
            
            TextField("Add a new todo", text: $addtodo)
            
            Toggle("Date", isOn: $adddate)
            
            if adddate {
                HStack {
                    DatePicker(selection: $adddatevalue, in: ...Date(), displayedComponents: .date) {
                        Text("")
                    }
                    DatePicker(selection: $adddatevalue, in: ...Date(), displayedComponents: .hourAndMinute) {
                        Text("")
                    }
                }
            }
            
            Button("ADD") {
                var newtodo = Todo()
                newtodo.tododescription = addtodo
                if adddate {
                    newtodo.duedate = adddatevalue
                }
                
                modelContext.insert(newtodo)
            }
                        
            Toggle("Show done", isOn: $showdone)
            
            List {
                ForEach(todoitems) { item in
                    VStack {
                        HStack {
                            Text(item.tododescription)
                            
                            Spacer()
                            
                            Button(item.tododone ? "DONE" : "NOT DONE") {
                                item.tododone.toggle()
                            }
                        }
                        if let duedate = item.duedate {
                            Text(duedate, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            
            
        }
        
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: Todo.self, inMemory: true)
}









/*

 struct ContentView: View {
     @Environment(\.modelContext) private var modelContext
     @Query private var items: [Item]

     var body: some View {
         NavigationSplitView {
             List {
                 ForEach(items) { item in
                     NavigationLink {
                         Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                     } label: {
                         Text(item.timestamp, format: Date.FormatStyle(date: .long, time: .standard))
                     }
                 }
                 .onDelete(perform: deleteItems)
             }
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     EditButton()
                 }
                 ToolbarItem {
                     Button(action: addItem) {
                         Label("Add Item", systemImage: "plus")
                     }
                 }
             }
         } detail: {
             Text("Select an item")
         }
     }

     private func addItem() {
         withAnimation {
             let newItem = Item(timestamp: Date())
             modelContext.insert(newItem)
         }
     }

     private func deleteItems(offsets: IndexSet) {
         withAnimation {
             for index in offsets {
                 modelContext.delete(items[index])
             }
         }
     }
 }

*/
