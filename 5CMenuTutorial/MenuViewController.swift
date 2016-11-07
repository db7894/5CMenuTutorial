//
//  TableViewController.swift
//  5CMenuTutorial
//
//  Created by Maddie on 11/4/16.
//  Copyright © 2016 Maddie Zug. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MenuViewController: UITableViewController {
    
    var menuItems: [String] = []
    var selectedDiningHall: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        //Read in data from the ASPC Menu API
        Alamofire.request(.GET, "https://aspc.pomona.edu/api/menu/dining_hall/cmc/day/sun?auth_token=8227601fb7f5768fb6ccf9f5ab38c4700b884ea0").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                let foodItems = json[0]["food_items"]
                self.menuItems = foodItems.arrayObject as! [String]
                
                //Update our table to show our menu data!
                self.tableView.reloadData()
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuItemCell", forIndexPath: indexPath)

        cell.textLabel?.text = menuItems[indexPath.row]
        

        return cell
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
