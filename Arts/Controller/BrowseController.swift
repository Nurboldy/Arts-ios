//
//  BrowseController.swift
//  Arts
//
//  Created by nurboldy on 12/23/18.
//  Copyright © 2018 nurboldy. All rights reserved.
//

import UIKit
import SDWebImage
class BrowseController: UITableViewController {
    
    let cellId = "cellId"
    var arts : [Art] = [Art]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Browse"
        tableView.register(ArtCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        handleRefresh()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc private func handleRefresh() {
        API.getAllSong(completion: {(_error: Error?, _ arts: [Art]?) in
            if let arts = arts {
                self.arts = arts
                self.tableView.reloadData()
            }
        })
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArtCell
        let currentLastItem = arts[indexPath.row]
        cell.art = currentLastItem
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = BrowseCollectionViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class ArtCell : UITableViewCell {
    
    var art : Art? {
        didSet {
            let url = URL(string: "AAA")
            artImage.Image = imageView?.sd_setImage(with: url, completed: nil)
            artNameLabel.text = art?.artName
            artDescriptionLabel.text = art?.artDesc
        }
    }
    
    
    private let artNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let artDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let artImage : UIImageView = {
        let imgView = UIImageView()
            imgView.contentMode = .scaleAspectFit
            imgView.clipsToBounds = true
            imgView.layer.cornerRadius = 10
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(artImage)
        addSubview(artNameLabel)
        addSubview(artDescriptionLabel)
        
        artImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        artNameLabel.anchor(top: topAnchor, left: artImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        artDescriptionLabel.anchor(top: artNameLabel.bottomAnchor, left: artImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
        //        let stackView = UIStackView(arrangedSubviews: [decreaseButton,artQuantity,increaseButton])
        //        stackView.distribution = .equalSpacing
        //        stackView.axis = .horizontal
        //        stackView.spacing = 5
        //        addSubview(stackView)
        //        stackView.anchor(top: topAnchor, left: artNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

