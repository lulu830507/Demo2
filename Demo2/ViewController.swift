//
//  ViewController.swift
//  Demo2
//
//  Created by 林思甯 on 2021/7/19.
//

import UIKit

class ViewController: UIViewController {
    
    let characterImages = ["snoopy", "woodstock", "charlie"]
    let nameLabels = ["SNOOPY", "WOODSTOCK", "CHARLIE"]
    let pageNumberLabels = ["1", "2", "3"]
    var selectIndex: Int = 0
    
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var Images: UIImageView!
    @IBOutlet weak var pageDot: UIPageControl!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var pageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageLabel.text = pageNumberLabels[0]
        nameLabel.text = nameLabels[0]
    }
    
    func sync() {
        Images.image = UIImage(named: characterImages[selectIndex])
        nameLabel.text = nameLabels[selectIndex]
        pageLabel.text = pageNumberLabels[selectIndex]
        pageDot.currentPage = selectIndex
        segment.selectedSegmentIndex = selectIndex
    }
    
    @IBAction func changePageDot(_ sender: UIPageControl) {
        selectIndex = sender.currentPage
        if pageDot.currentPage == 0 {
            selectIndex = 0
            sync()
        } else if pageDot.currentPage == 1 {
            selectIndex = 1
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        selectIndex = sender.selectedSegmentIndex
        if segment.selectedSegmentIndex == 0 {
            selectIndex = 0
            sync()
        } else if segment.selectedSegmentIndex == 1 {
            selectIndex = 1
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    
    
    @IBAction func leftButton(_ sender: UIButton) {
        selectIndex -= 1
        if selectIndex == 2 {
            
            sync()
        } else if selectIndex == 1 {
            sync()
        } else if selectIndex == 0 {
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    
    @IBAction func rightButton(_ sender: Any) {
        selectIndex += 1
        if selectIndex == 0 {
            sync()
        } else if selectIndex == 1 {
            sync()
        } else if selectIndex == 2 {
            sync()
        } else {
            selectIndex = 0
            sync()
        }
    }
    
    @IBAction func swipeChangePage(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left {
            selectIndex += 1
            if selectIndex == 0 {
                sync()
            } else if selectIndex == 1 {
                sync()
            } else if selectIndex == 2 {
                sync()
            } else {
                selectIndex = 0
                sync()
            }
        } else if sender.direction == .right {
            selectIndex -= 1
            if selectIndex == 2 {
                sync()
            } else if selectIndex == 1 {
                sync()
            } else if selectIndex == 0 {
                sync()
            } else {
                selectIndex = 2
                sync()
            }
        }
        
    }
    
}

