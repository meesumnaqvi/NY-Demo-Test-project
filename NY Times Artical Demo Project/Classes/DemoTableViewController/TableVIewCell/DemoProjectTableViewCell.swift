//
//  DemoProjectTableViewCell.swift
//  NY Times Artical Demo Project
//
//  Created by M Faizan Mujahid on 03/02/2024.
//

import UIKit

class DemoProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var headingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellImageView.layer.cornerRadius = self.cellImageView.frame.height/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpViewAccordingTo(model: Article?) {
        self.headingLabel.text = model?.title
        self.descriptionLabel.text = model?.abstract
        self.dateLabel.text = model?.publishedDate
        self.nameLabel.text = model?.source
    }
    
}
