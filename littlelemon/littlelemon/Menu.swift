//
//  Menu.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/3/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack(){
            Text("Little Lemon")
            Text("Chicago")
            Text("Description")
            List {
                EmptyView()
            }
        }
        .onAppear(){
            getMenuData()
        }
    }
    
    func getMenuData() -> () {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let menuItems = try! decoder.decode(MenuList.self, from: data)

            }
            else if let error = error {
                print("Request Failed with this error: \(error)")
            }
        }
        
        task.resume()
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
