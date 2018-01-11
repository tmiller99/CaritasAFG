//
//  PostViewController.swift
//  AFG
//
//  Created by Trey Miller on 1/9/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {

    var i:String?
    
    @IBOutlet weak var postTableView: UITableView!

    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBAction func testButtonAction(_ sender: Any) {
        
        
        self.testLabel.text = i
        
        
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //postTableView.delegate = self
        //postTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(i)
        // We will simply print out the value here
        //print("The value of myStringValue is: \(ident!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
struct postTableData1 {
    let title:String
    let user:String
    let date:String
    let identifier:String
}
