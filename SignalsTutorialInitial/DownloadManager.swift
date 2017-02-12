//
//  DownloadManager.swift
//  SignalsTutorialComplete
//
//  Created by John Raymund Catahay on 12/02/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation
import Signals

protocol CanDownloadItems {
    func requestDownload(item: DownloadableItem)
}

protocol CanBroadcastTasks {
    var downloadTasksSignal: Signal<[Int:DownloadItemTask]> { get set }
}

class DownloadManager: CanDownloadItems, CanBroadcastTasks{
    
    static let shared = DownloadManager()
    
    var downloadTasksSignal = Signal<[Int:DownloadItemTask]>()
    private var downloadTasks = [Int:DownloadItemTask]()
    
    func requestDownload(item: DownloadableItem){
    }
}
