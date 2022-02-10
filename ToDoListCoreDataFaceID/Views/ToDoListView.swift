//
//  ToDoListView.swift
//  ToDoListCoreDataFaceID
//
//  Created by Marek Roslik on 9.02.22.
//

import SwiftUI



struct ToDoListView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: ToDoList.getAllToDoList()) var items: FetchedResults<ToDoList>
    @State var text: String = ""
    
    var body: some View {
            List {
                Section(header: Text("New item")) {
                    HStack {
                        TextField("Enter new item...", text: $text)
        
                        Button {
                            if !text.isEmpty{
                                
                                let newItem = ToDoList(context: context)
                                newItem.content = text
                                newItem.date = Date()
                                
                                do {
                                    try context.save()
                                }
                                catch {
                                    print(error)
                                }
                                
                                text = ""
                                
                            } else {
                                print("Field is empty")
                            }

                        } label: {
                            Text("Add")
                        }

                    }
                }
                Section {
                    ForEach(items) { item in
                        VStack(alignment: .leading) {
                            Text(item.content!)
                                .font(.headline)
                            Text("\(item.date!.formatted(date: .numeric, time: .shortened))")
                                .font(.caption2)
                        }
                    }
                    .onDelete { indexSet in
                        guard let index = indexSet.first else { return }
                        let itemDelete = items[index]
                        context.delete(itemDelete)
                        do {
                            try context.save()
                        }
                        catch {
                            print(error)
                        }
                }
                }
            }
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
