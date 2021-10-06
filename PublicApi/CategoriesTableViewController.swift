//
//  CategoriesTableViewController.swift
//  PublicApi
//
//  Created by Jeremy Warren on 10/5/21.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    
    var categories: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        EntryManager.fetchAllCategories { categories in
            DispatchQueue.main.async {
                self.categories = categories
                self.tableView.reloadData()
            }
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        categories.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
            cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let indexPath = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? EntriesTableViewController else {return }
        
        let category = categories[indexPath.row]
        
        destination.category = category
        
    }
    

}
