//
//  MenuList.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/5/23.
//

import Foundation

struct MenuList: Decodable {
    init(from decoder: Decoder) throws {
        menu = []
    }
    
    var menu: [MenuItem]

}
