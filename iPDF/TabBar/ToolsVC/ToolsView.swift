//
//  ToolsView.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import UIKit

class Fonts {
    static let medium =   "Montserrat-Medium"
    static let semibold = "Montserrat-SemiBold"
    static let bold =     "Montserrat-Bold"
}

class ToolsView: UIView {
    
    var titleLbl = UILabel()
    var searchBar = UISearchBar()
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    var bottomHeight: CGFloat
    
   init(tabBarHeight: CGFloat) {
    self.bottomHeight = tabBarHeight
       super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // напиши init и забирай tabBAr size
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        setUI()
        layout()
    }
    
    func setUI() {
        
        ui.setLabel(label: titleLbl,
                    view: self,
                    labelText: "Tools",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .left,
                    fontSize: 24,
                    fontName: Fonts.bold)

        searchBar.placeholder = "Search tools"
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        
        tableView.backgroundColor = .white.withAlphaComponent(0.6)
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
    }
}
