//
//  ViewController.swift
//  stormy
//
//  Created by Николай Белиовский on 02/11/2018.
//  Copyright © 2018 Николай Белиовский. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl")
            {
                pictures.append(item)
				
            }
        }
		print(pictures)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

