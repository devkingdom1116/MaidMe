//
//  SuggestedWorkerCell.swift
//  MaidMe
//
//  Created by Ngoc Duong Phan on 1/11/17.
//  Copyright © 2017 SmartDev. All rights reserved.
//

import UIKit
import SWTableViewCell

class SuggestedWorkerCell: SWTableViewCell {
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var detailServiceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceUnitLabel: UILabel!
    @IBOutlet weak var ratingView: RatingStars!
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var hourLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(){
        backgroundCardView.backgroundColor = UIColor.whiteColor()
        contentView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        self.removeSeparatorLineInset()
        backgroundCardView.clipsToBounds = false
        backgroundCardView.layer.shadowOpacity = 0.25
    }
    
    func showWorkerInfo(worker: SuggesstedWorker){
        nameLabel.text = worker.firstName! + " " + worker.lastName!
        if worker.price != 0 {
            priceLabel.text = String.localizedStringWithFormat("%.2f", worker.price)
        } else {
            priceLabel.text = "0.00"
        }
        if worker.availableTime != 0{
            let time = NSDate(timeIntervalSince1970: worker.availableTime / 1000)
            dayLabel.text = time.getDayOfWeek()
            timeLabel.text = time.getDayMonthAndHour()
        }
        detailServiceLabel.text = "AED \(Int(worker.price_per_hour)) per hour"
        hourLabel.text = "\(worker.hour as Int)H"
        serviceLabel.text = worker.serviceType?.name?.uppercaseString
        ratingView.setRatingLevel(worker.rateAverage)
        if let service = worker.serviceType?.avatar {
            loadImageFromURLwithCache(service, imageLoad: serviceImage)
        }
    }
    
    
}
