//
//  EntriesTableViewController.swift
//  PublicApi
//
//  Created by Jeremy Warren on 10/5/21.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    var category = ""
    var entries: [Entry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        EntryManager.fetchEntries(for: category) { entries in
            DispatchQueue.main.async {
                self.entries = entries
                self.tableView.reloadData()
            }
        }
        

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        entries.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
            cell.textLabel?.text = entries[indexPath.row].name
            cell.detailTextLabel?.text = entries[indexPath.row].description
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? ViewController else { return }
        let entry = entries[indexPath.row]
        destination.entry = entry
    }
    

}
