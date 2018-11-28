//
//  PassthroughViewSpec.swift
//  WolmoCoreTests
//
//  Created by Gabriel Mazzei on 28/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation

import Quick
import Nimble
import WolmoCore

public class PassthroughViewSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#hitTest(_with:)") {
            
            var passthroughView: PassthroughView!
            
            beforeEach {
                passthroughView = PassthroughView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            }
            
            context("When the view is touched in an empty space") {
                
                it("should return nil") {
                    let point = CGPoint(x: 20, y: 20)
                    let touched = passthroughView.hitTest(point, with: nil)
                    expect(touched).to(beNil())
                }
                
            }
            
            context("When the view is touched in a subview") {
                
                it("should return the subview") {
                    let subview = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                    passthroughView.addSubview(subview)
                    let point = CGPoint(x: 20, y: 20)
                    let touched = passthroughView.hitTest(point, with: nil)
                    
                    expect(touched == subview).to(beTrue())
                }
                
            }
        }
    }
    
}
