//
//  ViewController.swift
//  ExampleApplication
//
//  Created by Levent ORAL on 22.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let AdFormatList = [
        ("Banner 320x50 from Storyboard", "banner350x50FromStoryboardSegue"),
        ("Banner 320x50 Programatically", "banner320x50ProgramaticallySegue"),
        ("Interstitial", "interstitialSegue"),
        ("Rewarded Video", "rewardBasedVideoAdSegue")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AdFormatList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basicCell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        basicCell.textLabel?.text = AdFormatList[indexPath.row].0
        return basicCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: AdFormatList[indexPath.row].1, sender: self)
    }
}

