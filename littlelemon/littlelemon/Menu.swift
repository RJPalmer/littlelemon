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
            
            FetchedObjects(content: {
                (dishes:[Dish]) in List{
                    ForEach(dishes){
                        dish in HStack(alignment: VerticalAlignment.center,
                        spacing: 10){
                            AsyncImage(url: URL(string: dish.image!)) { Image in
                                Image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:100, height: 100)
                            } placeholder: {
                                EmptyView()
                            }

                            Text(dish.title!)
                            Spacer(minLength: 5)
                            Text(dish.price!)
                            
                                 }
                                 
                                 }
                }
            })
        }
        .onAppear(){
            getMenuData()
        }
    }
    
    func getMenuData() -> () {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        var menuItems:[MenuItem] = []
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let readItems = try! decoder.decode(MenuList.self, from: data)
                menuItems = readItems.menu
                
                for item in menuItems {
                    let dishItem:Dish = Dish(entity: Dish.entity(), insertInto: viewContext)
                    dishItem.title = item.title
                    dishItem.price = item.price
                    dishItem.dishDescription = item.description
                    dishItem.category = item.category
                    dishItem.image = item.image
                    
                }
                try? viewContext.save()
            }
            else if let response = response{
                print("\(response)")
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
