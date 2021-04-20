//
//  TodoView.swift
//  hewi
//
//  Created by 조민서 on 2021/04/01.
//

import SwiftUI
import RealmSwift

struct TodoView : View {
    
    @StateObject var modelData = ToDoViewModel()
    
    var todos : Results<Todo>?
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("TODO LIST")
                    .font(.title)
                
                ScrollView {
                    VStack(alignment: .center ,spacing: 15) {
                        
                        ForEach(modelData.todos) { todo in
                            VStack(alignment: .leading, spacing: 10, content: {
                                Text(todo.title)
                                Text(todo.desc)
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                //Text("기한: \(todo.timestamp)")
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .background(Color.red.opacity(0.15))
                            .cornerRadius(10)
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                            .contextMenu(menuItems: {
                                Button(action: {modelData.deleteData(object: todo)}, label: {
                                    Text("Delete Item")
                                })
                                
                                Button(action: {
                                    modelData.updateObject = todo
                                    modelData.openNewPage.toggle()
                                }, label: {
                                    Text("Update Item")
                                })
                            })
                        }
                    }
                }
                .background(NavigationConfigurator { nc in
                    nc.hidesBarsOnSwipe = true
                })
                .navigationBarHidden(true)
                .padding()
            }
            .padding(.top)
        }
        .navigationBarTitle("TODO", displayMode: .inline)
        .navigationBarItems(
            trailing: Button(action: {modelData.openNewPage.toggle()}
            ){
                Image(systemName: "plus")
                    .font(.title)
            }).sheet(isPresented: $modelData.openNewPage, content: {
                AddTodoView()
                    .environmentObject(modelData)
            })
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
