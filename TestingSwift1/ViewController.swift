//
//  ViewController.swift
//  TestingSwift1
//
//  Created by Admin on 29.10.14.
//  Copyright (c) 2014 NightQuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController /*, UITableViewDataSource, UITableViewDelegate*/ {
//@IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func register(sender :UIButton)//это делается при нажатии кнопки регистрацции.
    {
        
    }
}

/*   func tableView(tableView: UITableView, numberOfRowsInSection section:    Int) -> Int {
return 10
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")

cell.textLabel.text = "Row #\(indexPath.row)"
cell.detailTextLabel?.text = "Subtitle #\(indexPath.row)"

return cell
}*/