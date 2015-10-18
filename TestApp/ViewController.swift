//
//  ViewController.swift
//  TestApp
//
//  Created by Jeroen Berrevoets on 17/10/15.
//  Copyright © 2015 Jeroen Berrevoets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    var count: Int = 0
    
    // MARK: UIKIT VARs
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: IBActions
    @IBAction func increment(sender: AnyObject) {
        self.count++
        self.showCount()
    }
    @IBAction func reset(sender: AnyObject) {
        self.count = 0
        self.showCount()
    }
    @IBAction func decrement(sender: AnyObject) {
        self.count--
        self.showCount()
    }
    
    // MARK: Costum funcs
    func showCount(){
        self.countLabel.text = String(self.count)
    }
    func decrementAmount(amount: Int){
        self.count -= amount
        self.showCount()
    }
    func incrementAmount(amount: Int){
        self.count += amount
        self.showCount()
    }
    
    // MARK: Lifecycle
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

