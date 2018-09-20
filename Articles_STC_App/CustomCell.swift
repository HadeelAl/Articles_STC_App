//
//  CustomCell.swift
//  mytestinghere
//
//  Created by Hadeel Almushigih on 9/18/18.
//  Copyright © 2018 HALMUSHIGIH. All rights reserved.
//

import UIKit
class CustomCell : UITableViewCell {
    
    
    var articleImgView: UIImage?
    var articleTitleLabel: String?
    var articleDescLabel: String?
    
    @IBOutlet weak var articleTitleLabelView : UILabel? = {
        var lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.sizeToFit()
        lbl.numberOfLines = 0
        lbl.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
        return lbl
    }()
    
    @IBOutlet weak var articleDescLabelView : UILabel? = {
        var lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.sizeToFit()
        lbl.numberOfLines = 0
        lbl.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
        return lbl
    }()
    
    @IBOutlet weak var articleImageView : UIImageView? = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(articleTitleLabelView)
//        addSubview(articleDescLabelView)
//        addSubview(articleImageView)
//
        articleImageView?.leftAnchor.constraint(equalTo: (articleTitleLabelView?.rightAnchor)!)
        articleImageView?.rightAnchor.constraint(equalTo: self.rightAnchor)
        articleImageView?.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        articleImageView?.topAnchor.constraint(equalTo: self.topAnchor)
        
        articleTitleLabelView?.leftAnchor.constraint(equalTo: self.leftAnchor)
        articleTitleLabelView?.rightAnchor.constraint(equalTo: (articleImageView?.rightAnchor)!)
        articleTitleLabelView?.bottomAnchor.constraint(equalTo: (articleDescLabelView?.topAnchor)!)
        articleTitleLabelView?.topAnchor.constraint(equalTo: self.topAnchor)
        
        articleDescLabelView?.leftAnchor.constraint(equalTo: self.leftAnchor)
        articleDescLabelView?.rightAnchor.constraint(equalTo: (articleImageView?.rightAnchor)!)
        articleDescLabelView?.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        articleDescLabelView?.topAnchor.constraint(equalTo: (articleTitleLabelView?.bottomAnchor)!)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let articleTitle = articleTitleLabel {
            articleTitleLabelView?.text = articleTitle
        }
        
        if let articleDesc = articleDescLabel {
            articleDescLabelView?.text = articleDesc
        }
        
        if let articleImg = articleImgView {
            articleImageView?.image = articleImg
        }
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //        required init?(coder aDecoder: NSCoder) {
    //            super.init(coder: aDecoder)
    //        }
    
    
    //    @IBOutlet weak var imgView: UIImageView!
    //    @IBOutlet weak var articleTitleLabel: UILabel!
    //    @IBOutlet weak var articleDescLabel: UILabel!
    //    var article : Articles? {
    //        didSet {
    //            articleTitleLabel.text = article?.title
    //            articleDescLabel.text = article?.content
    //        }
    //    }
    //
    //
    //    private let articleTitleLabel : UILabel = {
    //        let lbl = UILabel()
    //        lbl.textColor = .black
    //        lbl.font = UIFont.boldSystemFont(ofSize: 16)
    //        lbl.textAlignment = .left
    //        return lbl
    //    }()
    //
    //    private let articleDescLabel : UILabel = {
    //        let lbl = UILabel()
    //        lbl.textColor = .black
    //        lbl.font = UIFont.boldSystemFont(ofSize: 16)
    //        lbl.textAlignment = .left
    //        return lbl
    //    }()
    //
    //
    //    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    //        super.init(style: style, reuseIdentifier: reuseIdentifier)
    //        addSubview(articleTitleLabel)
    //        addSubview(articleDescLabel)
    
    //
    //        articleImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
    //        articleTitleLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    //        articleDescLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    //
    //    }
    
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //    }
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        //custom logic goes here
    //    }
    
    //    func setImage(image: UIImage)
    //    {
    ////        self.imgView?.image = image
    //
    //    }
}
