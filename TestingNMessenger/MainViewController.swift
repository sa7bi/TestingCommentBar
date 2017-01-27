//
//  MainViewController.swift
//  TestingNMessenger
//
//  Created by Sahbi H. Belgacem on 27.01.17.
//  Copyright © 2017 Sahbi H. Belgacem. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var segements: UISegmentedControl!
    
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
        add(asChildViewController: firstVC)
        remove(asChildViewController: secondVC)
        // Do any additional setup after loading the view.
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
        }else {
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
