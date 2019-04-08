//
//  TableViewController.swift
//  tableView_searchPage
//
//  Created by Luthfi Fathur Rahman on 5/21/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {

    var TableData:Array<String> = Array <String>()
    var TempTableData:Array<String> = Array <String>()
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    let filmJudul = ["The Dark Knight", "The Belko Experiment", "Hangover", "Harry Potter and The Order of Phoenix", "Nacho Libre", "Pirates of The Carribean: Dead Men Tell No Tale", "Spectre", "Star Trek", "Thor", "X-Men Apocalypse"]
    
    @IBOutlet weak var emptyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyView.isHidden = true
        
        TableData = filmJudul
        TempTableData = TableData
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            controller.searchBar.delegate = self
            
            return controller
        })()
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.isActive) {
            return self.filteredTableData.count
        }
        else {
            return 0//TableData.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        }
        else {
            cell.backgroundColor = UIColor(red: 244.0/255.0, green: 242.0/255.0, blue: 3.0/255.0, alpha: 1.0)
        }
        cell.accessoryType = .disclosureIndicator
        
        print("cellForRowAt filteredTableData= \(filteredTableData.count)")
        
        if(self.resultSearchController.isActive){
            cell.textLabel?.text = ""
            if (filteredTableData.count != 0) { //(TableData.count == filteredTableData.count) &&
                cell.textLabel?.text = filteredTableData[indexPath.row]
            } else { //if (TableData.count != 0)
                cell.textLabel?.text = TempTableData[indexPath.row]
            }
        } else {
            cell.textLabel?.text = ""
            cell.textLabel?.text = TableData[indexPath.row]
        }

        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        if(((currentCell.textLabel!.text) != "") && ((currentCell.textLabel!.text) != nil)){
            self.performSegue(withIdentifier: "SegueProd", sender: self)
            self.dismiss(animated: true, completion: nil)
        }
    }*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //untuk nampilin search result di tabel waktu user masih ngetik nama produk, sebeleum user menekan search button
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS %@", searchController.searchBar.text!)
        let array = (TempTableData as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        if filteredTableData.isEmpty {
            setEmptyViewVisible(visible: true)
        } else {
            setEmptyViewVisible(visible: false)
        }
        
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //let SBText = removeSpecialCharsFromString(text: searchBar.text!)
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //print("Button cancel in Search Bar is pressed")
        if((searchBar.text) != nil){
            searchBar.text = ""
        }
        setEmptyViewVisible(visible: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.resultSearchController.isActive = false
    }
    
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_".characters)
        return String(text.characters.filter {okayChars.contains($0) })
    }
    
    func setEmptyViewVisible(visible: Bool) {
        emptyView.isHidden = !visible
        if visible {
            self.tableView.bringSubviewToFront(emptyView)
        } else {
            self.tableView.sendSubviewToBack(emptyView)
        }
    }
}
