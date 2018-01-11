//
//  LoggedInViewController.swift
//  AFG
//
//  Created by Trey Miller on 12/8/17.
//  Copyright © 2017 Trey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoggedInViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var logout: UIButton!
    
    @IBOutlet weak var postTableView: UITableView!
    
    var identity:String?
    
    let posts:[postTableData] = [postTableData(title: "Potato", user: "tdam3@yahoo.com", date: "6/7/99", identifier: "1"), postTableData(title: "Watermelon", user: "tdam3@yahoo.com", date: "1/9/18", identifier: "2")]
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        postTableView.delegate = self
        postTableView.dataSource = self

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        /*(5)
         overriding the default implementation of view did appear so we can do custom actions
         */
        super.viewDidAppear(animated)
        /*(6)
         below forces the table view to call on its datasource methods to refresh the table
         */
        postTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.performSegue(withIdentifier: "logout", sender: Any?.self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*since we only have one section in our tableview, return the count of the items in our data array*/
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*we're not creating a custom cell here, but if you were to create a custom cell, this is where you would do it*/
        /*reuse identifier would be the name of our custom cell*/
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: nil)
        /*index path contains .row and .section integers*/
        cell.textLabel?.text = posts[indexPath.row].title
        cell.detailTextLabel?.text = posts[indexPath.row].date
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    /*(8)
     this is not a required method for UITableViewDelegate, but since we want to respond to a touch action we need to implement it
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*(9)
         instantiating a url from string COULD fail because the user may pass bad string data
         so we guard against it and return if the URL creation fails
         */
        //guard let url = URL(string: websites[indexPath.row].user) else{return}
        /*(10)
         UIApplication.shared === a static instance of our application; .open is a baked in method to open a url in safari
         */
        //UIApplication.shared.open(url, options: [:], completionHandler:nil)
        identity = posts[indexPath.row].identifier
        //print(identity)
        let myVC = self.storyboard?.instantiateViewController( withIdentifier: "PostViewController") as! PostViewController
        myVC.i = identity
        //self.navigationController?.pushViewController(myVC, animated: true)
        self.performSegue(withIdentifier: "post", sender: posts[indexPath.row])
    }

}
struct postTableData {
    let title:String
    let user:String
    let date:String
    let identifier:String
}
