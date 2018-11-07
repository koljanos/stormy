//
//  ViewController.swift
//  stormy
//
//  Created by Николай Белиовский on 02/11/2018.
//  Copyright © 2018 Николай Белиовский. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {
	@IBOutlet weak var searchBar: UISearchBar!
	var pictures = [String]()
	var filteredPictures = [String]()
	
	var inSearching = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        searchBar.delegate = self
		searchBar.returnKeyType = UIReturnKeyType.done
        for item in items {
		       pictures.append(item)
				
            }
        }
		print(pictures)
		title = "Storm Viewer"
		
    }
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if inSearching { return filteredPictures.count}
		else {
			return pictures.count
		}
		
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		if inSearching{
			
		}
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			// 2: success! Set its selectedImage property
			vc.selectedImage = pictures[indexPath.row]
			
			// 3: now push it onto the navigation controller
			navigationController?.pushViewController(vc, animated: true)
		}
		func searchBar (_ searchBar: UISearchBar, textDidChange searchText:String){
			
			if searchBar.text == nil || searchBar.text == "" {
				inSearching = false
				view.endEditing(true)
				tableView.reloadData()
			} else {
				inSearching = true
				filteredPictures = pictures.filter({$0 == searchBar.text})
				tableView.reloadData()
			}
		}
	}


}

