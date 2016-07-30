//
//  ViewController.swift
//  Sumo Bot
//
//  Created by Joseph Southern on 7/30/16.
//  Copyright © 2016 Joseph Southern. All rights reserved.
//

import UIKit
import SocketIOClientSwift

class ViewController: UIViewController {
    
    var socket:SocketIOClient =  SocketIOClient(socketURL: NSURL(string: "http://192.168.1.101")!, options: [.Log(true), .ForcePolling(true)])
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        connect()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func connect() {
        socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        socket.connect()
    }
    

    
    // MARK: - Directions
    
    //commands: ['left', 'right', 'forward', 'reverse', 'stop', 'drive']

    @IBAction func goFoward(sender: AnyObject) {
        socket.emit("forward", [])
        
    }
    
    @IBAction func goRight(sender: AnyObject) {
        socket.emit("right", [])
    }
    
    @IBAction func goLeft(sender: AnyObject) {
        socket.emit("left", [])
    }
    
    @IBAction func goReverse(sender: AnyObject) {
        socket.emit("reverse", [])
    }
    
    @IBAction func stopSumo(sender: AnyObject) {
        socket.emit("stop", [])
    }
    
    @IBAction func reconnect(sender: AnyObject) {
        connect()
    }
    

}

