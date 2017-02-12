//
//  DownloadItemStore.swift
//  SignalsTutorialComplete
//
//  Created by John Raymund Catahay on 12/02/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation

protocol CanFetchItems {
    func fetchItems() -> [DownloadableItem]
}

class DownloadItemStore: CanFetchItems{
    
    func fetchItems() -> [DownloadableItem] {
        var items = [DownloadableItem]()
        
        let item1 = DownloadableItem(name: "Downloadable Item 1", id: 1)
        let item2 = DownloadableItem(name: "Downloadable Item 2", id: 2)
        let item3 = DownloadableItem(name: "Downloadable Item 3", id: 3)
        let item4 = DownloadableItem(name: "Downloadable Item 4", id: 4)
        let item5 = DownloadableItem(name: "Downloadable Item 5", id: 5)
        let item6 = DownloadableItem(name: "Downloadable Item 6", id: 6)
        
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item5)
        items.append(item6)
        
        return items
    }
}
