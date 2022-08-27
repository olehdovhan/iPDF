//
//  MyFilesView.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit

class MyFilesView: UIView {
    
    var titleLbl = UILabel()
    var addDocumentBtn = UIButton()
    var searchBar = UISearchBar()
    var tableView = UITableView()
    var bottomHeight: CGFloat
    
    init(tabBarHeight: CGFloat) {
    self.bottomHeight = tabBarHeight
    super.init(frame: CGRect(x: .zero,
                             y: .zero,
                             width: 0,
                             height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // напиши init и забирай tabBAr size
    override func draw(_ rect: CGRect) {
        setUI()
        layout()
    }
    
    func setUI() {
        ui.setLabel(label: titleLbl,
                    view: self,
                    labelText: "My Files",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .left,
                    fontSize: 24,
                    fontWeight: .bold)
  
        
        searchBar.placeholder = "Search documents"
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        tableView.showsVerticalScrollIndicator = false
    }
    
    func layout() {
        ui.lblLayout(label: titleLbl,
                     view: self,
                     height: 27,
                     topC: hRatio(cH: 63),
                     leadingC: wRatio(cW: 20))

        ui.searchBarLayout(searchBar: searchBar,
                           view: self,
                           leadingC: 15,
                           trailingC: 15,
                           topToO: titleLbl.bottomAnchor,
                           topCG: 18)
        
        ui.layout(tableView: tableView,
                  view: self,
                  bottomC: bottomHeight,
                  leadingC: 15,
                  trailingC: 15,
                  topToO: searchBar.bottomAnchor,
                  topCG: 16)
   
        ui.setButton(button: addDocumentBtn,
                     view: self,
                     image: image(img: .greenPlusBtn),
                     controlState: .normal)
        
        ui.btnLayout(button: addDocumentBtn,
                     view: self,
                     width: wRatio(cW: 80),
                     height: wRatio(cW: 80),
                     bottomC: bottomHeight + 50,
                     trailingC: 15)
    }
}
