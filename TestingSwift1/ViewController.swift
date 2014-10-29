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
let apiURL="https://worlteam-m.com/mobile/api.php?q=" //адрес для запросов к "апи", к нему надо просто прибавить JSON в виде строки
let registerTemplate="{\"action\":\"register\",\"phone\":\"79150000000\"}"//
let loginTemplate="{\"action\":\"login\",\"username\":\"79153832915\",\"password\":\"12345\"}"//
let loginResponseTemplate="{\"code\":\"ok\",\"token\":\"<token-val>\"}"
let logoutTemplate="{\"action\":\"logout\",\"token\":\"<token-val>\"}"
var phone = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func phoneEdited(sender :UITextField)
    {
        phone = sender.text //при каждом редактировании сохараняем в нашу переменную новое значение поля
    }
    
   @IBAction func register(sender :UIButton)//это делается при нажатии кнопки регистрацции.
    {
         var phoneNumber = phone //вытаскиваем сюда значение телефона, который чувак зарегать хочет
        if phoneNumber.utf16Count > 5 {//если номер нормальной длины
            var result = tryRegister()
            if result.code != "OK" {
                
            }
        }
    }
    func tryRegister(phone :)
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