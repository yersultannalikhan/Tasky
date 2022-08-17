//
//  NewTaskView.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

class NewTaskView: UIView {

    // MARK: - Properties
    var selectedDate = Date()
    var dateSwitchAction: ((_ sender: UISwitch) -> ())?

    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Title"
        tf.keyboardType = .default
        tf.autocapitalizationType = .sentences
        tf.clipsToBounds = true
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 5.0
        tf.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        tf.layer.borderColor = UIColor.systemGray5.cgColor
        return tf
    }()
    
    let dateView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let dateStaticLabel: UILabel = {
        let l = UILabel()
        l.text = "Date"
        l.textColor = .black
        return l
    }()
    
    let dateSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = false
        return sw
    }()
    
    let dateTextField: UITextField = {
        let tf = UITextField()
        let date = String(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none))
        tf.text = date
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.isHidden = true
        tf.clipsToBounds = true
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 5.0
        tf.layer.borderColor = UIColor.systemGray5.cgColor
        return tf
    }()
    
    var datePicker: UIDatePicker!
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setupViews() {
        
        datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 200))
        datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        dateTextField.inputView = datePicker
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        datePicker.preferredDatePickerStyle = .wheels
        
          
        [titleTextField, dateView, dateTextField].forEach {
            self.addSubview($0)
        }
        dateSwitch.addTarget(self, action: #selector(dateSwitchTapped(_:)), for: .touchUpInside)
        [dateStaticLabel, dateSwitch].forEach {
            dateView.addSubview($0)
        }
    }
    
    func setupConstraints() {
        titleTextField.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 40))
        
        dateView.anchor(top: titleTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 40))
        
        dateStaticLabel.anchor(top: nil, leading: dateView.leadingAnchor, bottom: nil, trailing: nil)
        dateStaticLabel.anchorCenterY(centerY: dateView.centerYAnchor)
        
        dateSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: dateView.trailingAnchor)
        dateSwitch.anchorCenterY(centerY: self.dateView.centerYAnchor)
        
        dateTextField.anchor(top: dateView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 40))
    }
    
    func isDateTextFieldHidden(_ isHidden: Bool) {
        dateTextField.isHidden = isHidden
    }
    // MARK: - Actions
    @objc func dateSwitchTapped(_ sender: UISwitch) {
        dateSwitchAction?(_ : sender)
        dateTextField.resignFirstResponder()
    }
    
    @objc func datePickerDone() {
        dateTextField.resignFirstResponder()
      }

      @objc func dateChanged() {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd MMMM yyyy"
          dateTextField.text = dateFormatter.string(from: datePicker.date)
          selectedDate = datePicker.date
      }
}
