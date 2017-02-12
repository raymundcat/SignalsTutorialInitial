//
//  DownloadViewController.swift
//  SignalsTutorialComplete
//
//  Created by John Raymund Catahay on 12/02/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation

import UIKit

class DownloadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PresenterDelegate{
    
    let cellID = "cell"
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let cellNib = UINib(nibName: "DownloadItemTableViewCell", bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: cellID)
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 40
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var items = [DownloadableItem](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var tasks = [Int: DownloadItemTask](){
        didSet{
            tableView.reloadData()
        }
    }
    
    let presenter = DownloadPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        presenter.viewDidLoad()
    }
    
    //MARK: Presenter Delegate
    
    func presenterDidUpdate(items: [DownloadableItem]) {
        self.items = items
    }
    
    func presenterDidUpdateTasks(tasks: [Int : DownloadItemTask]) {
        self.tasks = tasks
    }
    
    //MARK: TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DownloadItemTableViewCell
        cell.item = items[indexPath.row]
        cell.task = tasks[items[indexPath.row].id]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didPressTable(atIndex: indexPath.row)
    }
}
