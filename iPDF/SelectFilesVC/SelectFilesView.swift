//
//  SelectFilesView.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import UIKit

class SelectFilesView: UIView {
    
    var backBtn = UIButton()
    var titleLbl = UILabel()
    var refreshBtn = UIButton()
    var purpleDescriptionLbl = UILabel()
    var searchBar = UISearchBar()
    var nextBtn = UIButton()
    var addFilesBtn = UIButton()
    var tableView = UITableView()
    
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        setUI()
        layout()
    }

    func setUI() {
        let conf = UIImage.SymbolConfiguration(hierarchicalColor: clr(color: .clrGreenTabTint)!)
        let img = UIImage(systemName: "chevron.left",
                          withConfiguration: conf)
        
        ui.setButton(button: backBtn,
                     view: self,
                     buttonText: "Back",
                     textColor: clr(color: .clrGreenTabTint),
                     fontName: Fonts.semibold,
                     fontSize: 16,
                     image: img,
                     controlState: .normal)
        
        backBtn.titleEdgeInsets = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: -wRatio(cW: 10))
        
        ui.setLabel(label: titleLbl,
                    view: self,
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .center,
                    fontSize: wRatio(cW: 16),
                    fontName: Fonts.semibold)
        
        ui.setButton(button: refreshBtn,
                     view: self,
                     image: image(img: .refresh),
                     controlState: .normal)
        
        ui.setLabel(label: purpleDescriptionLbl,
                    view: self,
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 13,
                    fontName: Fonts.semibold,
                    backgroundColor: clr(color: .clrGreenTabTint))
        
        searchBar.placeholder = "Search documents"
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        
        //plus.circle - системное название картинки
       // UIImage.SymbolConfiguration(scale: .large)
        let configuration = UIImage.SymbolConfiguration(hierarchicalColor: clr(color: .clrGreenTabTint)!)
        
        let circleImg = UIImage(systemName: "plus.circle",
                                withConfiguration: configuration)
        
        addFilesBtn.imageEdgeInsets = UIEdgeInsets(top: -5,
                                                   left: -15,
                                                   bottom: -5,
                                                   right: 5)

        ui.setButton(button: addFilesBtn,
                     view: self,
                     buttonText: "Add Files",
                     backgroundColor: .white,
                     cornerRadius: 10,
                     textColor: clr(color: .clrGreenTabTint),
                     fontName: Fonts.semibold,
                     fontSize: 16,
                     image: circleImg,
                     controlState: .normal)
        addFilesBtn.layer.masksToBounds = false

        ui.shadow(object: addFilesBtn,
                  color: clr(color: .clrShadowButton),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))

        ui.setButton(button: nextBtn,
                     view: self,
                     buttonText: "Next",
                     backgroundColor: clr(color: .clrLineGray),
                     cornerRadius: 10,
                     textColor: .white,
                     fontName: Fonts.semibold,
                     fontSize: 16,
                     controlState: .normal)
        nextBtn.isUserInteractionEnabled = false
        
        tableView.showsVerticalScrollIndicator = false
    }
    
    func layout() {
        ui.universalLayout(object: backBtn,
                           parentView: self,
                           width: wRatio(cW: 60),
                           height: wRatio(cW: 22),
                           topC: hRatio(cH:23),
                           leadingC: wRatio(cW:13))
        
        ui.universalLayout(object: titleLbl,
                           parentView: self,
                           width: wRatio(cW: 219),
                           centerH: 0,
                           centerVtoO: backBtn.centerYAnchor)
        
        ui.universalLayout(object: refreshBtn,
                           parentView: self,
                           width: 36,
                           height: 36,
                           trailingC: wRatio(cW:20),
                           centerVtoO: backBtn.centerYAnchor)
        
        ui.universalLayout(object: purpleDescriptionLbl,
                           parentView: self,
                           width: w,
                           height: 40,
                           centerH: 0,
                           topToO: titleLbl.bottomAnchor,
                           topCG: 21)
        
        ui.universalLayout(object: searchBar,
                           parentView: self,
                           height: 36,
                           leadingC: wRatio(cW:15),
                           trailingC: wRatio(cW:15),
                           centerH: 0,
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: 17)
        
        ui.universalLayout(object: addFilesBtn,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 54),
                           bottomC: hRatio(cH: 29),
                           leadingC: hRatio(cH: 15))
        
        ui.universalLayout(object: nextBtn,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 54),
                           bottomC: hRatio(cH: 29),
                           trailingC: hRatio(cH: 15))
        
        ui.universalLayout(object: tableView,
                           parentView: self,
                           leadingC: wRatio(cW:15),
                           trailingC: wRatio(cW:15),
                           topToO: searchBar.bottomAnchor,
                           topCG: 4,
                           bottomToO: nextBtn.topAnchor,
                           bottomCG: 10)
    }
}
