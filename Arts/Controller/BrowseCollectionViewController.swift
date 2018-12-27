//
//  BrowseCollectionViewController.swift
//  Arts
//
//  Created by nurboldy on 12/23/18.
//  Copyright © 2018 nurboldy. All rights reserved.
//

import UIKit

class BrowseCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    let reuseIdentifier = "CellId"
    var colView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 300, height: 500)
        
        colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.delegate   = self
        colView.dataSource = self
        colView.register(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        colView.backgroundColor = UIColor.white
        
        self.view.addSubview(colView)
        

    }




    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        // Configure the cell
    
        return cell
    }


}

class CustomCell: UICollectionViewCell {
    
    let artLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.text = "Bob Lee"
        label.textAlignment = .center
        //label.backgroundColor = UIColor.red
        return label
    }()
    
    let artDetail: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "ahkldhsflkhasdkfhalks asjknfkjb askdjbfkjabsdkjfbasjkdb aksdbfkasbf asdfjbkajsdbfkbf asdbfksbf sak sakdjfb"
        label.isEditable = false
        label.isScrollEnabled = false
        //label.backgroundColor = UIColor.red
        return label
    }()
    
    private let artImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "beach_house_album.png"))
        imgView.contentMode = .scaleAspectFit
        //imgView.backgroundColor = UIColor.red
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func addViews(){
        backgroundColor = UIColor.black
        addSubview(artImage)
        addSubview(artLabel)
        addSubview(artDetail)

        artImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 290, height: 290, enableInsets: false)
        artLabel.anchor(top: artImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 290, height: 36, enableInsets: false)
        artDetail.anchor(top: artLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 290, height: 100, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
