//
//  ViewController.swift
//  PublicApi
//
//  Created by Jeremy Warren on 10/5/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var corsLabel: UILabel!
    @IBOutlet weak var httpsLabel: UILabel!
    @IBOutlet weak var authLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = entry?.name
        descriptionLabel.text = entry?.description
        authLabel.text = entry?.auth
        corsLabel.text = entry?.cors
        httpsLabel.text = "\(entry?.isHttps ?? false)"
        linkButton.setTitle(entry?.link.absoluteString ?? "", for: .normal)
    }
    @IBAction func linkButtonTapped(_ sender: UIButton) {
        guard let link = entry?.link else { return }
        let safari = SFSafariViewController(url: link)
        present(safari, animated: true)
    }
    

}

