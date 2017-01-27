//
//  ViewController.swift
//  TestingNMessenger
//
//  Created by Sahbi H. Belgacem on 26.01.17.
//  Copyright © 2017 Sahbi H. Belgacem. All rights reserved.
//

import UIKit
import ALTextInputBar

struct Message {
    var username: String
    var message: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    
    var messages: [Message] = [
        Message.init(username: "User 1", message: "Testing.. first message"),
        Message.init(username: "User 2", message: "Testing.. second message"),
        Message.init(username: "User 3", message: "Testing.. third message")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.bringSubview(toFront: textInputBar)
//        textInputBar.delegate = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
//        textInputBar.textView.placeholder = "Enter your comment here.."
//        textInputBar.textView.font = UIFont(name: "AvenirNext-Regular", size: 16)
////        textInputBar.backgroundColor = UIColor(hue:0.58, saturation:0.62, brightness:0.99, alpha:1.00)
//        textInputBar.textView.tintColor = UIColor.blue
//        textInputBar.textView.placeholderColor = UIColor(hue:0.57, saturation:0.09, brightness:0.84, alpha:1.00)
//        textInputBar.textView.textColor = UIColor.red
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        rightButton.isEnabled = true
//        rightButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
//        rightButton.setTitle("send", for: .normal)
//        rightButton.setTitleColor(UIColor.red, for: .disabled)
//        rightButton.setTitleColor(UIColor.white, for: .normal)
//        
//        rightButton.addTarget(self, action: #selector(dismissKeyBoard), for: .touchUpInside)
//        textInputBar.showTextViewBorder = false
//        textInputBar.rightView = rightButton
//        textInputBar.textView.textColor = UIColor.black
//        
//        charLimit.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        charLimit.text = "\(limit)"
//        charLimit.font = UIFont(name: "AvenirNext-Bold", size: 14)
//        charLimit.textColor = UIColor(hue:0.65, saturation:0.24, brightness:0.27, alpha:1.00)
//        textInputBar.leftView = charLimit
////        self.view.bringSubview(toFront: textInputBar)
////        textInputBar.isUserInteractionEnabled = true
//        self.parent?.view.addSubview(textInputBar)
    }
    
    
//    func dismissKeyBoard(){
//        print("in dismissKeyboard")
//        textInputBar.textView.resignFirstResponder()
//        self.view.endEditing(true)
//        let msg = Message.init(username: "User X", message: textInputBar.text)
//        textInputBar.text = ""
//        messages.append(msg)
//        tableView.reloadData()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        let message = messages[indexPath.row]
        cell.username.text = message.username
        cell.message.text = message.message
        return cell
    }


}

