//
//  DownloadItemTableViewCell.swift
//  SignalsTutorialComplete
//
//  Created by John Raymund Catahay on 12/02/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import UIKit

class DownloadItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.selectionStyle = .none
    }
    
    var item = DownloadableItem(){
        didSet{
            titleLabel.text = item.name
        }
    }
    
    var task: DownloadItemTask?{
        didSet{
            progressLabel.isHidden = task == nil
            progressLabel.text = task != nil ? "\(task!.progress)%" : ""
        }
    }
}
