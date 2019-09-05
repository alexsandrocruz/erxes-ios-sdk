//
//  MoreView.swift
//  erxesiosdk
//
//  Created by Soyombo bat-erdene on 8/31/19.
//  Copyright © 2019 Soyombo bat-erdene. All rights reserved.
//

import UIKit
protocol MoreViewDelegate: class  {
    func close()
    func end()
}
class MoreView: UIViewController {
    weak var delegate: MoreViewDelegate?
    var endButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.setTitle("End conversation".localized(lang), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(endAction), for: .touchUpInside)
        return button
    }()
    
    var closeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.setTitle("Close".localized(lang), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(endButton)
        self.view.addSubview(closeButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func closeAction(){
        self.dismiss(animated: true) {
            self.delegate?.close()
        }
        
    }
    
    @objc func endAction(){
        self.dismiss(animated: true) {
            self.delegate?.end()
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        endButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    

}
