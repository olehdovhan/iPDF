//
//  ToolsTVCell.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import UIKit

class ToolsTVCell: UITableViewCell {
    
    static var id = "ToolsTVCell"
    var toolIconImgVw = UIImageView()
    var mainLbl = UILabel()
    var rightArrowBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUI()
        layout()
    }
    
    override func prepareForReuse() {
        mainLbl.text = nil
        toolIconImgVw.image = nil
    }
    
    func fillCellBy(model: ToolsModel) {
        toolIconImgVw.image = image(img: model.imgName)
        mainLbl.text = model.name
    }
    
    private func setUI() {
     
        ui.setImgVw(imgVw: toolIconImgVw,
                    view: self,
                    image: image(img: .grid),
                    cntntMode: .scaleAspectFill)
        
        ui.setLabel(label: mainLbl,
                    view: self,
                    labelText: "Grid",
                    textColor: .black,
                    textAlignment: .left,
                    fontSize: 16,
                    fontName: "Montserrat-Medium")

        let conf = UIImage.SymbolConfiguration(hierarchicalColor: .gray)
        let image = UIImage(systemName: "chevron.right",
                            withConfiguration: conf)
    
        ui.setButton(button: rightArrowBtn,
                     view: contentView,
                     image: image,
                     controlState: .normal)
        
        rightArrowBtn.imageView?.image?.withAlignmentRectInsets(UIEdgeInsets(top: 6,
                                                                             left: 9,
                                                                             bottom: 9,
                                                                             right: 6))
    }
    
    private func layout() {
        
        ui.layout(imgVw: toolIconImgVw,
                  view: self,
                  width: 22,
                  height: 22,
                  topC: 15,
                  leadingC: 16)
        
        ui.lblLayout(label: mainLbl,
                     view: self,
                     height: 22,
                     topC: 16,
                     leadingToO: toolIconImgVw.trailingAnchor,
                     leadingCG: 13)
    
        ui.btnLayout(button: rightArrowBtn,
                     view: self,
                     width: 24,
                     height: 24,
                     trailingC: 24,
                     centerV: 0)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
