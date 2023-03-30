//
//  SecondViewController.swift
//  NewsAppNew2
//
//  Created by Indira on 30/3/23.
//

import UIKit
import SnapKit
import Kingfisher

class SecondViewController: UIViewController {

    private var imageview: UIImageView = {
        let v = UIImageView()
        return v
    }()
    private var label: UILabel = {
        let l = UILabel()
        l.textColor = .purple
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 20)
        return l
    }()
    private var detailLabel: UILabel = {
        let l = UILabel()
        l.textColor = .purple
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 16)
        l.numberOfLines = 0
        return l
    }()
    var string = "ura"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    public func configure(with: Article){
        label.text = with.title
        detailLabel.text = with.description
        imageview.kf.setImage(with: URL(string: with.urlToImage!))
    }
    private func setupUI() {
        view.addSubview(imageview)
        imageview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(200)
            make.width.equalTo(300)
            make.right.left.equalToSuperview().inset(30)
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(imageview.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(20)
        }
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(20)
        }
    }


}
