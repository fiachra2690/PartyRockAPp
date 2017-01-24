//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Fiachra Coyne on 23/01/2017.
//  Copyright © 2017 Fiachra Coyne. All rights reserved.
//

import UIKit
//How protocols work in iOS
class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://goo.gl/images/TYrqc6", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/pvfFuASYgfM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Thunder Road")
        
        let p2 = PartyRock(imageURL: "https://goo.gl/images/6FJ55V", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/IxuThNgl3YA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Born To Run")
        
        let p3 = PartyRock(imageURL: "https://goo.gl/images/cfCcBL", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/6xfXswFmSzM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Backstreets")
        
        let p4 = PartyRock(imageURL: "https://goo.gl/images/H2jL5L", videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQh8yxEkzrY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Promise")
        
        let p5 = PartyRock(imageURL: "https://goo.gl/images/OeCZLY", videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/MMuATQgiJJM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lucky Town")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        

        
        
        
        tableView.delegate = self
        tableView.dataSource = self
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Party Cell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinatation = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destinatation.partyRock = party
            }
        }
    }



}

