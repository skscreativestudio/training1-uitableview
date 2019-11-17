//
//  ViewController.swift
//  Training 1 UITableView
//
//  Created by Gordan Saw on 11/15/19.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import UIKit

//Create Member Data Properties
struct Member {
    var id:Int
    var name:String
    
    init(id:Int , name:String){
        self.id = id
        self.name = name
    }
}

class MemberCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setMember(member : Member){
        idLabel.text = String (member.id)
        nameLabel.text = member.name
        
    }
    
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    
    @IBOutlet weak var memberTableView: UITableView!
    var members: [Member] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        members = createArray()
    }
    
   
    @IBAction func sortIdBtnClick(_ sender: UIButton) {
        sortAscendId()
    }
    
    @IBAction func sortNameBtnClick(_ sender: UIButton) {
        sortAscendName()
    }
    
    func createArray()->[Member]{
        var tempMembers: [Member] = []
        
        let member1 = Member(id:1,name:"Shiro")
        let member2 = Member(id:2,name:"Lina")
        let member3 = Member(id:3,name:"Wakaba")
        let member4 = Member(id:4,name:"Rin")
        
        tempMembers.append(member1)
        tempMembers.append(member2)
        tempMembers.append(member3)
        tempMembers.append(member4)
        
        return tempMembers
    }
    
    func sortAscendName(){
        let tempSortNameList = members.sorted(by: {$0.name < $1.name})
        
        members = tempSortNameList
        memberTableView.reloadData()
        print("Sort Name \(tempSortNameList)")
    }
    
    func sortAscendId(){
        let tempSortIdList = members.sorted(by: {$0.id < $1.id})
        members = tempSortIdList
        memberTableView.reloadData()
        print("Sort Id \(tempSortIdList)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let member = members[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell") as! MemberCell
       
        cell.setMember(member: member)
        
        return cell
    }


}

