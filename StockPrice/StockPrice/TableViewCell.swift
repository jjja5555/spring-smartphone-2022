//
//  TableViewCell.swift
//  StockPrice
//
//  Created by Xiao Huang on 4/10/22.
//

import UIKit

protocol SendStockDelegate{
    func sendStockData(quote : Quote)
}

class TableViewCell: UITableViewCell {

    @IBOutlet var lblSymbol: UILabel!
    @IBOutlet var lblName: UILabel!
    var quote = Quote()
    
    var sendStockDelegate : SendStockDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getStock(_ sender: Any) {
        let temp = quote
        sendStockDelegate?.sendStockData(quote: temp)
    }
}
