//
//  TabBarController.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit

class TabBarController: UITabBarController {

    var filesBtn = UIButton()
    var toolsBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        
        viewControllers = [UINavigationController(rootViewController: MyFilesVC()),
                           UINavigationController(rootViewController: ToolsVC())]
        setUI()
        
        filesBtn.addTarget(self, action: #selector(filesAction(sender:)), for: .touchUpInside)
        toolsBtn.addTarget(self, action: #selector(toolsAction(sender:)), for: .touchUpInside)
    }
    
    func setUI() {
        
        filesBtn.setImage(view.image(img: .tabMyFiles) ?? UIImage(), for: .normal)
        filesBtn.setImage(view.image(img: .tabSelectedMyFiles) ?? UIImage(), for: .selected)
        filesBtn.isSelected = true
        
        toolsBtn.setImage(view.image(img: .tabTools) ?? UIImage(), for: .normal)
        toolsBtn.setImage(view.image(img: .tabSelectedTools) ?? UIImage(), for: .selected)
        
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.9
      
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.ui.genericlLayout(object: blurEffectView,
                               parentView: view,
                               height: 100,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        view.ui.genericlLayout(object: filesBtn,
                               parentView: view,
                               width: 130,
                               height: 90,
                               bottomC: 10,
                               leadingC: view.wRatio(cW: 30))
        
        view.ui.genericlLayout(object: toolsBtn,
                               parentView: view,
                               width: 130,
                               height: 90,
                               bottomC: 10,
                               trailingC: view.wRatio(cW: 30))
    }
    
    @objc func filesAction(sender: UIButton) {
        sender.isSelected = true
        toolsBtn.isSelected = false
        selectedIndex = 0
    }
    
    @objc func toolsAction(sender: UIButton) {
        sender.isSelected = true
        filesBtn.isSelected = false
        selectedIndex = 1
    }
}
