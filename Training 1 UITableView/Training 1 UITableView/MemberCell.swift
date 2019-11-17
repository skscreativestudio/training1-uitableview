//
//  MemberCell.swift
//  Training 1 UITableView
//
//  Created by Gordan Saw on 11/15/19.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import UIKit




class MemberCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setMember(member : Member){
        idLabel.text = String (member.id)
        nameLabel.text = member.name
        
    }
    
}
