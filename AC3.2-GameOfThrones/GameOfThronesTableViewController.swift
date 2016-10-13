//
//  GameOfThronesTableViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Jason Gresh on 10/11/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GameOfThronesTableViewController: UITableViewController {
    
    var episodes = [GOTEpisode]()
    let cellIdentifier: String = "GOTEpisodeTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Game of Thrones"
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let data = episodes.filter { (episode) -> Bool in
            return (episode.season - 1 ) == section
        }
        
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        let data = episodes.filter { (episode) -> Bool in
            return (episode.season - 1 ) == indexPath.section
        }
        
        let episode = data[indexPath.row]
        
        cell.textLabel?.text = String(episode.number) + ". " + episode.name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tappedEpisodeCell: UITableViewCell = sender as? UITableViewCell{
            if segue.identifier == "EpisodeDetailSegue"{
                let episodeView: EpisodeDetailViewController = segue.destination as! EpisodeDetailViewController
                let cellIndexPath: IndexPath = self.tableView.indexPath(for: tappedEpisodeCell)!
                
                let episode: GOTEpisode = episodes.filter { (episode) -> Bool in
                    return (episode.season - 1 ) == cellIndexPath.section }[cellIndexPath.row]
                
                episodeView.episode = episode
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season " + String(section+1)
        
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "got", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let dict = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSDictionary else {
                return
        }
        
        if let episodes = dict?.value(forKeyPath: "_embedded.episodes") as? [[String:Any]] {
            for epDict in episodes {
                if let ep = GOTEpisode(withDict: epDict) {
                    self.episodes.append(ep)
                }
            }
        }
        }
        
}
