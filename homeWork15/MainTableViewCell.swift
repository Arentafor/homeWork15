//
//  MainTableViewCell.swift
//  homeWork15
//
//  Created by Виталий Крюков on 20.12.2021.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    let descriptionText: UILabel = {
       let label = UILabel()
        label.font = Constants.Fonts.UI14Regular
        label.textColor = Constants.Colors.black
        //        label.text = Constants.Text.textDescription
        label.numberOfLines = 0
        return label
    }()
    
    let timeAgoText: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.UI14Regular
        label.textColor = Constants.Colors.gray
//        label.text = Constants.Text.timeAgoText
       return label
    }()
    
    let headerText: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.UI14Regular
        label.textColor = Constants.Colors.black
//        label.text = Constants.Text.headerText
       return label
    }()
    
    
    func setConstraintsCell() {
        headerText.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
        }
        
        timeAgoText.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
        }
        
        descriptionText.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(80)
        }
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "celll")
        
        contentView.addSubview(descriptionText)
        contentView.addSubview(timeAgoText)
        contentView.addSubview(headerText)
        setConstraintsCell()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    

}
