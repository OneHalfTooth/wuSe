//
//  MMRegistViewController.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/27.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMRegistViewController.h"

@interface MMRegistViewController (){
    UIImageView * _imageView;
    UITextField * _userNameTextField;
    UITextField * _passWordTextFiled;
    UITextField * _restatCodeTextField;
    UIButton * _registButton;
    UIButton * _restatCodeButton;
}

@end

@implementation MMRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBlur];
    [self createLogo];
    [self createBackButton];
    [self createUserNameTextField];
    [self createRestatCodeTextField];
    [self createRestatCodeButton];
    [self createPassWordTextFiled];
    [self createRegistButton];
    [self createAction];
}
- (void)createAction{
    /** 注册按钮的状态*/
    RAC(_registButton,enabled) = [RACSignal combineLatest:@[_userNameTextField.rac_textSignal,_restatCodeTextField.rac_textSignal,_passWordTextFiled.rac_textSignal] reduce:^id{
        return @(_userNameTextField.text.length >= 11 && _restatCodeTextField.text.length == 4 && _passWordTextFiled.text.length >= 6);
    }];
//    __weak typeof(self)weakself = self;
    [RACObserve(_registButton, enabled) subscribeNext:^(id x) {
        BOOL enable = [x boolValue];
        if (enable) {
            _registButton.backgroundColor = [UIColor redColor];
        }else{
            _registButton.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        }
    }];
    [_userNameTextField.rac_textSignal subscribeNext:^(id x) {
        if (_userNameTextField.text.length == 11) {
            [_restatCodeTextField becomeFirstResponder];
        }
    }];
    [_restatCodeTextField.rac_textSignal subscribeNext:^(id x) {
        if (_restatCodeTextField.text.length == 4) {
            [_passWordTextFiled becomeFirstResponder];
        }
    }];

}
/** 创建一个验证码按钮 */
- (void)createRestatCodeButton{
    _restatCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_restatCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    _restatCodeButton.layer.borderWidth = 1.f;
    _restatCodeButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _restatCodeButton.layer.masksToBounds = YES;
    _restatCodeButton.layer.cornerRadius = 5.f;
    _restatCodeButton.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [self.view addSubview:_restatCodeButton];
    [_restatCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_restatCodeTextField.mas_bottom);
        make.left.equalTo(_restatCodeTextField.mas_right).with.offset(10);
        make.right.equalTo(_userNameTextField.mas_right);
        make.height.equalTo(@30);
    }];
}
/** 创建一个高斯模糊 */
- (void)createBlur{
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = self.view.bounds;
    [self.view addSubview:effectView];
}
- (void)createLogo{
    _imageView = [[UIImageView alloc]init];
    [self.view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(80);
    }];
    _imageView.userInteractionEnabled = YES;
    _imageView.image = [UIImage imageNamed:@"login_logo"];
}
- (void)createBackButton{
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.height.with.equalTo(@23);
        make.top.equalTo(self.view.mas_top).with.offset(33);
    }];
    [backButton setImage:[UIImage imageNamed:@"vedio_nav_btn_back_nor"] forState:UIControlStateNormal];
    __weak typeof(self)weakself = self;
    [[backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)createRestatCodeTextField{
    _restatCodeTextField = [self createTextFieldFactoryByTitle:@"验证码"];
    _restatCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_restatCodeTextField];
    [_restatCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNameTextField.mas_bottom).with.offset(25);
        make.right.equalTo(_userNameTextField.mas_right).with.offset(-100);
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.height.equalTo(@30);
    }];
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_restatCodeTextField.mas_bottom).with.offset(5);
        make.right.equalTo(_restatCodeTextField.mas_right);
        make.left.equalTo(_restatCodeTextField.mas_left);
        make.height.equalTo(@1);
    }];
}
- (void)createUserNameTextField{
    _userNameTextField = [self createTextFieldFactoryByTitle:@"手机号"];
    [self.view addSubview:_userNameTextField];
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).with.offset(60);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.height.equalTo(@30);
    }];
    _userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNameTextField.mas_bottom).with.offset(5);
        make.right.equalTo(_userNameTextField.mas_right);
        make.left.equalTo(_userNameTextField.mas_left);
        make.height.equalTo(@1);
    }];
}
- (void)createPassWordTextFiled{
    _passWordTextFiled = [self createTextFieldFactoryByTitle:@"密码"];
    [self.view addSubview:_passWordTextFiled];
    [_passWordTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_restatCodeTextField.mas_bottom).with.offset(25);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.height.equalTo(@30);
    }];
    _passWordTextFiled.secureTextEntry = YES;
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passWordTextFiled.mas_bottom).with.offset(5);
        make.right.equalTo(_passWordTextFiled.mas_right);
        make.left.equalTo(_passWordTextFiled.mas_left);
        make.height.equalTo(@1);
    }];
}
- (void)createRegistButton{
    UIButton * registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:registButton];
    registButton.backgroundColor = [UIColor redColor];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passWordTextFiled.mas_bottom).with.offset(40);
        make.right.equalTo(_passWordTextFiled.mas_right);
        make.left.equalTo(_passWordTextFiled.mas_left);
        make.height.equalTo(@40);
    }];
    registButton.layer.masksToBounds = YES;
    registButton.layer.cornerRadius = 5.f;
    registButton.enabled = NO;
    _registButton = registButton;
}
/** 工程类生产textField */
- (UITextField *)createTextFieldFactoryByTitle:(NSString *)title{
    UITextField * textField = [[UITextField alloc]init];
    textField.placeholder = title;
    textField.textColor = [UIColor whiteColor];
    textField.font = [UIFont systemFontOfSize:16];
    textField.tintColor = [UIColor whiteColor];
    [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    return  textField;
}
/** 点击其他位置收起键盘 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
