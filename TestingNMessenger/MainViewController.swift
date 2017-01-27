//
//  MainViewController.swift
//  TestingNMessenger
//
//  Created by Sahbi H. Belgacem on 27.01.17.
//  Copyright © 2017 Sahbi H. Belgacem. All rights reserved.
//

import UIKit
import ALTextInputBar

class MainViewController: UIViewController, ALTextInputBarDelegate {

    @IBOutlet weak var segements: UISegmentedControl!
    
    let rightButton = UIButton()
    let charLimit = UILabel()
    let limit = 200
    
    let textInputBar = ALTextInputBar()
    
    override var inputAccessoryView: UIView? {
        get {
            return textInputBar
        }
    }
    
    // Another ingredient in the magic sauce
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func textViewDidChange(textView: ALTextView) {
        if textView.text.characters.count > limit {
            charLimit.text = "0"
            charLimit.textColor = UIColor.red
            rightButton.isEnabled = false
            rightButton.setTitle("❌", for: .normal)
            
        }else {
            rightButton.isEnabled = true
            rightButton.setTitle("send", for: .normal)
            charLimit.textColor = UIColor(hue:0.65, saturation:0.24, brightness:0.27, alpha:1.00)
            charLimit.text = "\(limit - textView.text.characters.count)"
        }
        
    }

    
    private lazy var firstVC: FirstViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "firstVC") as! FirstViewController
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var secondVC: ViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "secondVC") as! ViewController
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        textInputBar.delegate = self
        textInputBar.textView.placeholder = "Enter your comment here.."
        textInputBar.textView.font = UIFont(name: "AvenirNext-Regular", size: 16)
        //        textInputBar.backgroundColor = UIColor(hue:0.58, saturation:0.62, brightness:0.99, alpha:1.00)
        textInputBar.textView.tintColor = UIColor.blue
        textInputBar.textView.placeholderColor = UIColor(hue:0.57, saturation:0.09, brightness:0.84, alpha:1.00)
        textInputBar.textView.textColor = UIColor.red

        
        rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        rightButton.isEnabled = true
        rightButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        rightButton.setTitle("send", for: .normal)
        rightButton.setTitleColor(UIColor.red, for: .disabled)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        
        rightButton.addTarget(self, action: #selector(dismissKeyBoard), for: .touchUpInside)
        textInputBar.showTextViewBorder = false
        textInputBar.rightView = rightButton
        textInputBar.textView.textColor = UIColor.black
        
        charLimit.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        charLimit.text = "\(limit)"
        charLimit.font = UIFont(name: "AvenirNext-Bold", size: 14)
        charLimit.textColor = UIColor(hue:0.65, saturation:0.24, brightness:0.27, alpha:1.00)
        textInputBar.leftView = charLimit
        textInputBar.isHidden = true
        add(asChildViewController: firstVC)
        remove(asChildViewController: secondVC)
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyBoard(){
        print("in dismissKeyboard")
        textInputBar.textView.resignFirstResponder()
        self.view.endEditing(true)
        let msg = Message.init(username: "User X", message: textInputBar.text)
        textInputBar.text = ""
        secondVC.messages.append(msg)
        secondVC.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    @IBAction func tabsChanged(_ sender: Any) {
        if segements.selectedSegmentIndex == 0 {
            add(asChildViewController: firstVC)
            remove(asChildViewController: secondVC)
            textInputBar.isHidden = true
        }else {
            textInputBar.isHidden = false
            remove(asChildViewController: firstVC)
            add(asChildViewController: secondVC)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
