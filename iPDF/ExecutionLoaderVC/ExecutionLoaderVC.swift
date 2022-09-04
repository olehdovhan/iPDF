//
//  ExecutionLoaderVC.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class ExecutionLoaderVC: UIViewController {
    
    var vw = ExecutionLoaderVw()
    var toolIdentier: Tools
    
    init(tool: Tools ) {
        self.toolIdentier = tool
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(vw)
        vw.frame = view.bounds
        vw.descriptionLbl.text = "\(toolIdentier.rawValue) in process..."
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let vc = CongratulationsVC(tool: self.toolIdentier)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true) { }
        }
    }
}
