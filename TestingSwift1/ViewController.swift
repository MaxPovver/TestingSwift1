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
let apiURL="http://nightquest-pro.1gb.ru/mobile/api.php?q=" //адрес для запросов к "апи", к нему надо просто прибавить JSON в виде строки
let registerTemplate="{\"action\":\"register\",\"phone\":\"79150000000\"}"//
let loginTemplate="{\"action\":\"login\",\"username\":\"79153832915\",\"password\":\"12345\"}"//
let loginResponseTemplate="{\"code\":\"ok\",\"token\":\"<token-val>\"}"
let logoutTemplate="{\"action\":\"logout\",\"token\":\"<token-val>\"}"
var phone = ""
var registered=false
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
        self.phone = sender.text //при каждом редактировании сохараняем в нашу переменную новое значение поля
    }
   @IBAction func register(sender :UIButton)//это делается при нажатии кнопки регистрацции.
    {
         var phoneNumber = self.phone //вытаскиваем сюда значение телефона, который чувак зарегать хочет
        if phoneNumber.utf16Count > 5 {//если номер нормальной длины
            println("registering  \(self.phone)")
            self.tryRegister(phoneNumber)
        }
        else
        {
            println("incorrect number \(self.phone)")//здесь будет вывод сообщения "ваш номер слишком длинный" в айфоне
        }
    }
    func tryRegister(phone: NSString)
    {
        let registerData="{\"action\":\"register\",\"username\":\"\(phone)\"}"
        let registerURL=self.apiURL + registerData
        let encoded = registerURL.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        println(registerURL+"="+encoded!)
        var url: NSURL = NSURL(string: encoded!)!
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if((error) != nil) {
                println(error.localizedDescription)
            }
            var err: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if (err? != nil) {
                println(error.localizedDescription)
            }
           // println(jsonResult["message"])
            dispatch_async(dispatch_get_main_queue(), {
                self.processRegistrationResult(jsonResult)
            })
        })
        task.resume()
    }
    func processRegistrationResult(json:NSDictionary)
    {
        if (json["code"] as String != "OK" ){
            println(json["message"] as String)
        } else
        {
            println("Register OK. Wait for SMS with code")
        }
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