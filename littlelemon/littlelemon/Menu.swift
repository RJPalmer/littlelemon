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
    @State var dishCat:String = "mains"
    
    @FetchRequest(entity: Dish.entity(), sortDescriptors: []) var dishList: FetchedResults<Dish>
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 0){
            headerView()
            
                VStack(alignment: .center){
                    HeroView(searchText: $searchText)
                        .onChange(of: searchText){
                            newValue in
                               let filterPred = NSPredicate(format: "title CONTAINS[cd] %@ OR category == %@", searchText, newValue)
                                dishList.nsPredicate = filterPred
                        }
                    MenuBreakdown(dishCategory: $dishCat)
                        .onChange(of: dishCat) { newValue in
                           let filterPred = NSPredicate(format: "title CONTAINS[cd] %@ OR category == %@", searchText, newValue)
                            dishList.nsPredicate = filterPred
                        }
                        
                    VStack(alignment: .center){
                            List{
                                ForEach(dishList){
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
                    Spacer()
                }
                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
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
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicates() -> NSPredicate{
        if(searchText.isEmpty){
            return NSPredicate(format: "category == %@", dishCat)
        }
        else{
            let searchPred =  NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            let catPred = NSPredicate(format: "category == %@", dishCat)
            
            return NSCompoundPredicate(orPredicateWithSubpredicates:[searchPred, catPred])
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
