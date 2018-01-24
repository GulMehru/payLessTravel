//
//  AppDelegate.swift
//  JetCompare
//
//  Created by GulMehru on 20/01/2018.
//  Copyright © 2018 gul. All rights reserved.
//



import Foundation
import UIKit

protocol SidebarViewDelegate: class {
    func sidebarDidSelectRow(row: Row)
}

enum Row: String {
    case editProfile
    case home
    case flights
    case hotels
    case cars
    case insurance
    case blog
    case about_us
    case contact_us
    case none
    
    init(row: Int) {
        switch row {
        case 0: self = .editProfile
        case 1: self = .home
        case 2: self = .flights
        case 3: self = .hotels
        case 4: self = .cars
        case 5: self = .insurance
        case 6: self = .blog
        case 7: self = .about_us
        case 8: self = .contact_us
        default: self = .none
        }
    }
}

class SidebarView: UIView, UITableViewDelegate, UITableViewDataSource {

    var titleArr = [String]()
    
    weak var delegate: SidebarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.white
        //(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
        self.clipsToBounds=true
        
        titleArr = [ " ", "Home", "Flights", "Hotels", "Cars", "Insurance", "Blog", "About us", "Contact us"]
     
        setupViews()
       // self.myTableView.rowHeight = 5.0
        myTableView.delegate=self
        myTableView.dataSource=self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.estimatedRowHeight = 2
        myTableView.layer.masksToBounds = false
        myTableView.layer.borderWidth = 0;
        myTableView.tableFooterView=UIView()
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        //myTableView.allowsSelection = true
        myTableView.bounces=false
        myTableView.showsVerticalScrollIndicator=false
        myTableView.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            //cell.backgroundColor=UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1.0)
            let cellImg: UIImageView!
            cellImg = UIImageView(frame: CGRect(x: 10, y: 10, width: 230, height: 45))
            //cellImg.layer.cornerRadius = 5
            cellImg.layer.masksToBounds=true
            //cellImg.contentMode = .scaleAspectFill
            cellImg.layer.masksToBounds=true
            cellImg.image=#imageLiteral(resourceName: "logoPayL")
            cell.addSubview(cellImg)
            
            let cellLbl = UILabel(frame: CGRect(x: 110, y: cell.frame.height/2-15, width: 250, height: 120))
            cell.addSubview(cellLbl)
            cellLbl.text = titleArr[indexPath.row]
            cellLbl.font=UIFont.systemFont(ofSize: 17)
            cellLbl.textColor=UIColor.white
        } else {
            cell.textLabel?.text=titleArr[indexPath.row]
            cell.textLabel?.textColor=UIColor.darkGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.sidebarDidSelectRow(row: Row(row: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 85
        } else {
            return 40
        }
    }
    
    func setupViews() {
        self.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let myTableView: UITableView = {
        let table=UITableView()
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


