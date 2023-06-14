//
//  ContentView.swift
//  ViewInfo
//
//  Created by Himanshu Churi on 5/15/23.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Bridge: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    let country: String
    let desc: String
    let city: String
}

class UserViewModel: ObservableObject{
    
    @Published var bridges = [Bridge]()
    private var db = Firestore.firestore()
    
    
    func fetchfromDB(){
        
        db.collection("data").addSnapshotListener { (QuerySnapshot, Error) in
                if let error = Error {
                        print("Error retreiving collection: \(error)")
                    }
                guard let documents = QuerySnapshot?.documents
                else {
                    print("No documents")
                    return
                }
            print(documents)
                
            self.bridges = documents.map{
                    queryDocumentSnapshot -> Bridge in
                    let data = queryDocumentSnapshot.data()
                    
                    let name = data["name"] as? String  ?? ""
                    let city = data["city"] as? String  ?? ""
                    let country = data["country"] as? String  ?? ""
                    let desc = data["desc"] as? String  ?? ""
                return Bridge(name: name, country: country, desc: desc, city: city)
                
            }
        }
    }
    
}


struct ContentView: View {
    
    @ObservedObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.bridges, id: \.id){ brge in
                VStack{
                    Text(brge.name).font(.title2)
                    HStack{
                        Circle()
                            .frame(width:75, height:75)
                        Spacer()
                        VStack{
                            Text(brge.city)
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(brge.country)
                                .font(.footnote)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Text(brge.desc).frame(maxWidth: .infinity, alignment: .leading)
                        .font(.caption)
                }
                
            }.navigationBarTitle("Bridges")
                .onAppear(){
                    viewModel.fetchfromDB()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
