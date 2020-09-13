//
//  ChatViewController.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 23.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextView: UITextView!
    
    var testMessages = [
    Message(messageText: "It is a long text about something. I'am just need to test my code :))) Hello, how are you? So, it is not enough, i need more text, aughr!! Woooow, it seems to work, nice!!!!", messageSender: "dsa"),
    Message(messageText: "Hello world!", messageSender: "me"),
    Message(messageText: "Wow, it's working", messageSender: "asd"),
    Message(messageText: "Yep", messageSender: "me"),
    Message(messageText: "It is look awesome, i love this chat, the best chat evere", messageSender: "me"),
    Message(messageText: "No, this is a usual chat, it's even look like iMessage", messageSender: "asdasd"),
    Message(messageText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, b", messageSender: "asd"),
    Message(messageText: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonab", messageSender: "me")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        messageTextView.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: Constants.cellIdentifire)
        
        setupMessageTextView()
        addObserveKeyboardNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(row: testMessages.count - 1, section: tableView.numberOfSections - 1)
        tableView.scrollToRow(at: indexPath, at: .none, animated: false)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if messageTextView.text.isEmpty == false {
            testMessages.append(Message(messageText: messageTextView.text, messageSender: "me"))
            messageTextView.text = ""
            textViewDidChange(messageTextView)
            
            let indexPath = IndexPath(row: testMessages.count - 1, section: tableView.numberOfSections - 1)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
    }
    
    @IBAction private func logOutButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupMessageTextView() {
        messageTextView.addBorderWith(round: 3)
        textViewDidChange(messageTextView)
        messageTextView.clipsToBounds = true
        hideKeyboardWhenTappedAround()
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func keyboardWillChange(notification: NSNotification) {
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = keyboardSize.cgRectValue.height
            
            self.view.frame.origin.y -= height
        }
    }
}

//MARK: -TableView
extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifire, for: indexPath) as! MessageCell
        
        let message = testMessages[indexPath.row]
        
        cell.messageModel = message
        
        return cell
    }
}

//MARK: -UITextViewDelegate
extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                if estimatedSize.height < view.frame.height / 4 {
                    constraint.constant = estimatedSize.height
                    textView.isScrollEnabled = false
                } else {
                    constraint.constant = view.frame.height / 4
                    textView.isScrollEnabled = true
                }
            }
        }
    }
}
