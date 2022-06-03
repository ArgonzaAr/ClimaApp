//
//  TableViewCell.swift
//  ClimaApp
//
//  Created by UNAM FCA 01 on 03/06/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
