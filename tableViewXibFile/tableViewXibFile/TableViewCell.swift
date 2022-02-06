//
//  TableViewCell.swift
//  tableViewXibFile
//
//  Created by Xiao Huang on 2/6/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblImage: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
