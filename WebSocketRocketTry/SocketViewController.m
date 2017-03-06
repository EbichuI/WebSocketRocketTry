//
//  SocketViewController.m
//  WebSocketRocketTry
//
//  Created by 张建伟 on 17/3/4.
//  Copyright © 2017年 张建伟. All rights reserved.
//

#import "SocketViewController.h"
#import "SocketModel.h"
@interface SocketViewController ()
{
    UITextField * textField;
    SocketModel * socketModel;
}

@end

@implementation SocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    socketModel=[SocketModel share];
    self.view.backgroundColor=[UIColor blueColor];
    textField=[[UITextField alloc]initWithFrame:CGRectMake(50, 100, 100,40)];
    textField.borderStyle=UITextBorderStyleRoundedRect;
//    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    textField.secureTextEntry = YES;
    textField.layer.masksToBounds=YES;
    textField.layer.cornerRadius=12;
    [self.view addSubview:textField];
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(50, 150, 100, 40)];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
//    button.titleLabel.font=[UIFont systemFontOfSize:0];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(sendMsg) forControlEvents:UIControlEventTouchUpInside];

    UIButton * button1=[[UIButton alloc]initWithFrame:CGRectMake(50, 200, 100, 40)];
    [button1 setTitle:@"连接"forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 10;
//    button1.titleLabel.font=[UIFont systemFontOfSize:0];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(startSocket) forControlEvents:UIControlEventTouchUpInside];

    UIButton * button2=[[UIButton alloc]initWithFrame:CGRectMake(50, 250, 100, 40)];
    [button2 setTitle:@"断开" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 10;
//    button2.titleLabel.font=[UIFont systemFontOfSize:0];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(stopSocket) forControlEvents:UIControlEventTouchUpInside];

    UIButton * button3=[[UIButton alloc]initWithFrame:CGRectMake(50, 300, 100, 40)];
    [button3 setTitle:@"sendPing" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button3.layer.masksToBounds = YES;
    button3.layer.cornerRadius = 10;
//    button3.titleLabel.font=[UIFont systemFontOfSize:0];
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(sendPing) forControlEvents:UIControlEventTouchUpInside];

}
-(void)sendMsg
{
    if (textField.text.length==0) {
        return;
    }
    [socketModel sendMsg:textField.text];
}
-(void)startSocket
{
    [socketModel connect];
}
-(void)stopSocket
{
    [socketModel disConnect];
}
-(void)sendPing
{
    [socketModel ping];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
