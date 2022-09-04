//
//  CongratulationVW.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class CongratulationVW: UIView {
    
    var toolName: Tools
    
  //  var logoImgVw = UIImageView()
    var goToFilesBtn = UIButton()
    var mainImgVW = UIImageView()
    var titleLbl = UILabel()
    var descriptionLbl = UILabel()
    
    init(tool: Tools) {
        self.toolName = tool
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        setUI()
        layout()
    }
    
    func setUI() {
        
//        ui.setImgVw(imgVw: logoImgVw,
//                    view: self,
//                    image: image(img: .mainLogo),
//                    cntntMode: .scaleAspectFit)
        
        ui.setButton(button: goToFilesBtn,
                     view: self,
                     buttonText: "Go to Files",
                     backgroundColor: clr(color: .clrGreenTabTint),
                     cornerRadius: 10,
                     textColor: .white,
                     fontSize: 16,
                     fontWeight: .semibold,
                     controlState: .normal)
        
        mainImgVW.image = image(img: .congratulaion)
        
        ui.setLabel(label: titleLbl,
                    view: self,
                    labelText: "Congratulations!",
                    textColor: .black,
                    textAlignment: .center,
                    fontSize: 24,
                    fontWeight: .bold)
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular),
                      NSAttributedString.Key.foregroundColor : clr(color: .clrSingleDocPlusMinus)]
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold),
                      NSAttributedString.Key.foregroundColor : UIColor.black]
        
        let attributedString1 = NSMutableAttributedString(string:"\(toolName.rawValue) is done. \nYour file is ",
                                                          attributes: attrs1 as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:"ExampleName.pdf",
                                                          attributes:attrs2)
        attributedString1.append(attributedString2)
        descriptionLbl.attributedText = attributedString1
        
        ui.setLabel(label: descriptionLbl,
                    view: self,
                    textAlignment: .center,
                    fontSize: 16,
                    fontWeight: .regular,
                    lines: 2)
    }
    
    func layout() {
        
//        ui.universalLayout(object: logoImgVw,
//                           parentView: self,
//                           width: wRatio(cW: 60),
//                           height: wRatio(cW: 100),
//                           topC: hRatio(cH: 42),
//                           centerH: 0)
        
        ui.universalLayout(object: mainImgVW,
                           parentView: self,
                           width: wRatio(cW: 200),
                           height: wRatio(cW: 168),
                           topC: hRatio(cH: 213),
                           centerH: 0)
        
        ui.universalLayout(object: titleLbl,
                           parentView: self,
                           height: 25,
                           centerH: 0,
                           topToO: mainImgVW.bottomAnchor,
                           topCG: hRatio(cH: 50))
        
        ui.universalLayout(object: descriptionLbl,
                           parentView: self,
                           height: 48,
                           centerH: 0,
                           topToO: titleLbl.bottomAnchor,
                           topCG: 20)
        
        ui.universalLayout(object: goToFilesBtn,
                           parentView: self,
                           height: wRatio(cW: 54),
                           leadingC: wRatio(cW: 15),
                           trailingC: hRatio(cH: 15),
                           topToO: descriptionLbl.bottomAnchor,
                           topCG: hRatio(cH: 50))
    }
}
