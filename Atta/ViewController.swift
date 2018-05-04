//
//  ViewController.swift
//  Atta
//
//  Created by mac on 4/29/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit


@available(iOS 9.0, *)
class ViewController: UIViewController  {
    
    ///////////////// initialization //////////////////////
    @IBOutlet weak var firstbtn: UIButton!
    @IBOutlet weak var secondbtn: UIButton!
    
    @IBOutlet weak var thirdbtn: UIButton!
    
    @IBOutlet weak var fourthbtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        //////// make ScrollView fit main view frame//////
        
        let scrollViewWidth:CGFloat = self.view.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        //////setting scroll view to fit images sizes /////
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 4, height:self.scrollView.frame.height)
        self.pageControl.currentPage = 0
        
        
        /////// setting images to ScrollView   ////////
        
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,
                                               width:scrollViewWidth,
                                               height:scrollViewHeight))
        imgOne.image = UIImage(named: "Slide1")
        
        let imgTwo = UIImageView(frame: CGRect(x:imgOne.frame.origin.x + imgOne.frame.width ,
                                               y:0 ,
                                               width:scrollViewWidth,
                                               height:scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide2")
        
        let imgThree = UIImageView(frame: CGRect(x:imgTwo.frame.origin.x + imgTwo.frame.width ,
                                                 y:0,width:scrollViewWidth,
                                                 height:scrollViewHeight))
        imgThree.image = UIImage(named: "Slide3")
        
        let imgFour = UIImageView(frame: CGRect(x:imgThree.frame.origin.x + imgThree.frame.width,
                                                y:0,
                                                width:scrollViewWidth,
                                                height:scrollViewHeight))
        imgFour.image = UIImage(named: "Slide4")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)

        //_ = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.moveToNextPage), userInfo: nil, repeats: true)
    }

        
        ////// function implemented to move to next image on slider ///////
    @objc func moveToNextPage (){
            
            let pageWidth:CGFloat = self.scrollView.frame.width
            let maxWidth:CGFloat = pageWidth * 4
            let contentOffset:CGFloat = self.scrollView.contentOffset.x
            
            var slideToX = contentOffset + pageWidth
            
            if  contentOffset + pageWidth == maxWidth
            {
                slideToX = 0
            }
            self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
        
        pageNumber = Int(scrollView.contentOffset.x / scrollView.frame.size.width);

        self.pageControl.currentPage = pageNumber

        }
        


    
    
    // must be internal or public.
    @objc func update() {
        // Something cool
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var pageNumber  = 0
}


extension ViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageNumber = Int(scrollView.contentOffset.x / scrollView.frame.size.width);
        self.pageControl.currentPage = pageNumber
        print(pageNumber)
    }
    
}

