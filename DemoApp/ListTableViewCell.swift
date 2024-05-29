//
//  ListTableViewCell.swift
//  DemoApp
//
//  Created by Arun Subbu on 5/29/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblId: UILabel!
    
    @IBOutlet weak var viewBorder: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
