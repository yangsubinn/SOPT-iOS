//
//  PostDetiailImages.swift
//  Presentation
//
//  Created by Junho Lee on 2022/10/10.
//  Copyright © 2022 SOPT-iOS. All rights reserved.
//

import UIKit

import Core

import SnapKit

final class PostDetailImagesCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let contentImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .gray
        return iv
    }()
    
    private let imageNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.546, green: 0.546, blue: 0.546, alpha: 1)
        return view
    }()
    
    private let imageNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 10"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    // MARK: - View Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostDetailImagesCVC {
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubviews(contentImageView)
        
        contentImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentImageView.addSubview(imageNumberView)
        imageNumberView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview()
            make.width.equalTo(58.adjusted)
            make.height.equalTo(33.adjustedH)
        }
        
        imageNumberView.addSubview(imageNumberLabel)
        imageNumberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
