//
//  DownloadPresenter.swift
//  SignalsTutorialComplete
//
//  Created by John Raymund Catahay on 12/02/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation

import Foundation

protocol PresenterDelegate {
    func presenterDidUpdate(items: [DownloadableItem])
    func presenterDidUpdateTasks(tasks: [Int: DownloadItemTask])
}

class DownloadPresenter{
    
    var delegate: PresenterDelegate?
    let itemsFetcher: CanFetchItems = DownloadItemStore()
    let downloader: CanDownloadItems = DownloadManager.shared
    let broadcastSource: CanBroadcastTasks = DownloadManager.shared
    
    var items = [DownloadableItem](){
        didSet{
            delegate?.presenterDidUpdate(items: items)
        }
    }
    var tasks = [Int:DownloadItemTask](){
        didSet{
            delegate?.presenterDidUpdateTasks(tasks: tasks)
        }
    }
    
    func viewDidLoad(){
        items = itemsFetcher.fetchItems()
    }
    
    func didPressTable(atIndex index: Int){
        downloader.requestDownload(item: items[index])
    }
}
