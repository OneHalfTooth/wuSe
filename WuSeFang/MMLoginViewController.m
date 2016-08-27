//
//  MMLoginViewController.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/27.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMLoginViewController.h"
#import "MMLoginTools.h"



@interface MMLoginViewController (){
    UIImageView * _imageView;
    UITextField * _userNameTextField;
    UITextField * _passWordTextFiled;
    UIButton * _loginButton;
}

@end

@implementation MMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
- (void)createView{
    [self createBlur];
    [self createLogo];
    [self createUserNameTextField];
    [self createPassWordTextFiled];
    [self createLoginButton];
    /** 创建返回按钮 */
    [self createBackButton];
    /** 创建忘记密码，注册按钮 */
    [self createRegistButtonAndLostButton];
}
- (void)createRegistButtonAndLostButton{
    UIButton * registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:registButton];
    [registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginButton.mas_left);
        make.width.greaterThanOrEqualTo(@2);
        make.height.greaterThanOrEqualTo(@3);
        make.top.equalTo(_loginButton.mas_bottom).with.offset(10);
    }];
    
    UIButton * lostButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lostButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [lostButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    lostButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:lostButton];
    [lostButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginButton.mas_right);
        make.width.greaterThanOrEqualTo(@2);
        make.height.greaterThanOrEqualTo(@3);
        make.top.equalTo(_loginButton.mas_bottom).with.offset(10);
    }];
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
- (void)createLoginButton{
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginButton];
    loginButton.backgroundColor = [UIColor redColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passWordTextFiled.mas_bottom).with.offset(40);
        make.right.equalTo(_passWordTextFiled.mas_right);
        make.left.equalTo(_passWordTextFiled.mas_left);
        make.height.equalTo(@40);
    }];
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.cornerRadius = 5.f;
    loginButton.enabled = NO;
    [RACObserve(loginButton, enabled) subscribeNext:^(id x) {
        BOOL enable = [x boolValue];
        if (enable) {
            loginButton.backgroundColor = [UIColor redColor];
        }else{
            loginButton.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        }
    }];
    RAC(loginButton,enabled) = [RACSignal combineLatest:@[_userNameTextField.rac_textSignal,_passWordTextFiled.rac_textSignal] reduce:^id{
        return @(_userNameTextField.text.length == 11 && _passWordTextFiled.text.length > 0);
    }];
    [[loginButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
    }];
    _loginButton = loginButton;
}
- (void)createPassWordTextFiled{
    _passWordTextFiled = [self createTextFieldFactoryByTitle:@"密码"];
    [self.view addSubview:_passWordTextFiled];
    [_passWordTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNameTextField.mas_bottom).with.offset(25);
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
- (void)createUserNameTextField{
    _userNameTextField = [self createTextFieldFactoryByTitle:@"手机号"];
    [self.view addSubview:_userNameTextField];
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).with.offset(100);
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

/** 创建一个高斯模糊 */
- (void)createBlur{
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = self.view.bounds;
    [self.view addSubview:effectView];
}
/** 点击其他位置收起键盘 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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

@end
