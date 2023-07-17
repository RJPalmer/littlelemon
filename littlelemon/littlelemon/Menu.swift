//
//  Menu.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/3/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText:String = ""
    
    var body: some View {
        VStack(alignment: .center){
            NavigationStack{
                VStack(alignment: .center){
                    headerView()
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    HeroView(searchText: searchText)
                        .border(Color.black, width: 1)
                    MenuBreakdown()
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    FetchedObjects(predicate: buildPredicates() ,sortDescriptors: buildSortDescriptors(), content: {
                        (dishes:[Dish]) in
                        VStack(alignment: .center){
                            List{
                                ForEach(dishes){
                                    dish in
                                    HStack(alignment: VerticalAlignment.top,
                                           spacing: 5){
                                        NavigationLink(destination: MenuItemDetails(menuDish: dish)
                                            .environment(\.managedObjectContext, CoreDataStack.context)) {
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
                            }
                        }
                    })
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
                .frame(maxHeight: .infinity)
                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
            }
        }
        .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
        .onAppear(){
            getMenuData()
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
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
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicates() -> NSPredicate{
        if(searchText.isEmpty){
            return NSPredicate(value: true)
        }
        else{
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

struct ExtractedView: View {
    var body: some View {
        Text("Little Lemon")
    }
}
