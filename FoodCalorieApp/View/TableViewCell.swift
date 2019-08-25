//
//  TableViewCell.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addConstraints()
      
    }
    
    func addConstraints() {
        
        addSubview(mainView)
        mainView.addSubview(Namelabel)
        mainView.addSubview(iView)
        mainView.addSubview(proteinlabel)
        mainView.addSubview(carblabel)
        mainView.addSubview(fatlabel)
        mainView.addSubview(calorielabel)
        mainView.addSubview(proteinLabelText)
        mainView.addSubview(carbLabelText)
        mainView.addSubview(fatLabelText)
        
        
        
        mainView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
       
        /*mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:   0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        */
        
        
        iView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /*iView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        iView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        iView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        */
        
        Namelabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(iView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(30)
        }
        //Namelabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        //Namelabel.leadingAnchor.constraint(equalTo: iView.trailingAnchor, constant: 10).isActive = true
        //Namelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        //Namelabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        calorielabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*calorielabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        calorielabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        calorielabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        calorielabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        proteinlabel.snp.makeConstraints { (make) in
            make.top.equalTo(Namelabel.snp.bottom)
            make.leading.equalTo(iView.snp.trailing).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*proteinlabel.topAnchor.constraint(equalTo: Namelabel.bottomAnchor, constant: 0).isActive = true
        proteinlabel.leadingAnchor.constraint(equalTo: iView.trailingAnchor, constant: 10).isActive = true
        proteinlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        proteinlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        carblabel.snp.makeConstraints { (make) in
            make.top.equalTo(Namelabel.snp.bottom)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*carblabel.topAnchor.constraint(equalTo: Namelabel.bottomAnchor, constant: 0).isActive = true
        carblabel.leadingAnchor.constraint(equalTo: proteinlabel.trailingAnchor, constant: 5).isActive = true
        carblabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        carblabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        fatlabel.snp.makeConstraints { (make) in
            make.top.equalTo(Namelabel.snp.bottom)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*
        fatlabel.topAnchor.constraint(equalTo: Namelabel.bottomAnchor, constant: 0).isActive = true
        fatlabel.leadingAnchor.constraint(equalTo: carblabel.trailingAnchor, constant: 5).isActive = true
        fatlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        fatlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        proteinLabelText.snp.makeConstraints { (make) in
            make.top.equalTo(Namelabel.snp.bottom).offset(20)
            make.leading.equalTo(iView.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*proteinLabelText.topAnchor.constraint(equalTo: Namelabel.bottomAnchor, constant: 20).isActive = true
        proteinLabelText.leadingAnchor.constraint(equalTo: iView.trailingAnchor, constant: 5).isActive = true
        proteinLabelText.widthAnchor.constraint(equalToConstant: 70).isActive = true
        proteinLabelText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        
        carbLabelText.snp.makeConstraints { (make) in
            make.top.equalTo(Namelabel.snp.bottom).offset(20)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*carbLabelText.topAnchor.constraint(equalTo: Namelabel.bottomAnchor, constant: 20).isActive = true
        carbLabelText.leadingAnchor.constraint(equalTo: proteinlabel.trailingAnchor, constant: 5).isActive = true
        carbLabelText.widthAnchor.constraint(equalToConstant: 70).isActive = true
        carbLabelText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        fatLabelText.snp.makeConstraints { (make) in
            make.top.equalTo(Namelabel.snp.bottom).offset(20)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /* fatLabelText.topAnchor.constraint(equalTo: Namelabel.bottomAnchor, constant: 20).isActive = true
         fatLabelText.leadingAnchor.constraint(equalTo: carblabel.trailingAnchor, constant: 5).isActive = true
        fatLabelText.widthAnchor.constraint(equalToConstant: 70).isActive = true
        fatLabelText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
    }
    
    let mainView: UIView = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
        }()
    
    let iView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "food")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    let Namelabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .black
        return view
        }()
    
    let calorielabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "kCal:"
        view.textAlignment = .center
        view.textColor = .black
        return view
        
    }()
    
    let proteinlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "Protein:"
        view.textAlignment = .center
        view.textColor = .black
        return view
        
    }()
    
    let carblabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Carbohydrate:"
        view.textAlignment = .center
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.textColor = .black
        return view
    }()
    
    let fatlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "Fat:"
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()

    let proteinLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.textColor = .red
        view.textAlignment = .center
        return view
        
    }()
    
    let carbLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .red
        view.textAlignment = .center
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        return view
    }()
    
    let fatLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.textColor = .red
        view.textAlignment = .center
        return view
    }()
    
}


