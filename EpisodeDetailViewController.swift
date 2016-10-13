//
//  EpisodeDetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Tong Lin on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    internal var episode: GOTEpisode!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Season " + String(episode.season)
        navigationItem.leftBarButtonItem?.title = "Back"
        titleLabel.text = episode.name
        dateLabel.text = episode.airdate
        seasonLabel.text = "Season " + String(episode.season) + "  Episode " + String(episode.number)
        summaryLabel.text = "Summary:\n" + episode.summary
        if let imageURL = URL(string: episode.originalImage), let data = try? Data(contentsOf: imageURL){
            episodeImage.image = UIImage(data: data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

     @IBAction func homePageButton(_ sender: UIButton) {
        guard let url = URL(string:episode.url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
     }
}
