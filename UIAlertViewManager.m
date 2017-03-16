//
//  UIAlertViewManager.m
//  UIAlertViewController
//
//  Created by Charlot on 2017/3/16.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "UIAlertViewManager.h"

@implementation UIAlertViewManager

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
      withCancelButton:(BOOL)withCancelButton
  textFieldPlaceholders:(NSArray *)textFieldPlaceholders
          actionTitles:(NSArray *)actionTitles
      textFieldHandler:(textFieldHandler)textFieldHandler
         actionHandler:(actionHandler)actionHandler{
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if ([textFieldPlaceholders count] > 0) {
        for (int i = 0; i < [textFieldPlaceholders count]; i++) {
            [alertViewController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = [NSString stringWithFormat:@"%@",textFieldPlaceholders[i]];
                textFieldHandler(textField, i);
            }];
        }
    }
    if ([actionTitles count] > 0) {
        for (NSUInteger i = 0; i < [actionTitles count]; i++) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@",actionTitles[i]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)  {
                actionHandler(action, i);
            }];
            [alertViewController addAction:action];
        }
    }
    if (withCancelButton) {
        [alertViewController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    }
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertViewController animated:YES completion:nil];
    
}


+ (void)actionSheettWithTitle:(NSString *)title
                      message:(NSString *)message
             withCancelButton:(BOOL)withCancelButton
                 actionTitles:(NSArray *)actionTitles
                actionHandler:(actionHandler)actionHandler {
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    if ([actionTitles count] > 0) {
        for (NSUInteger i = 0; i < [actionTitles count]; i++) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@",actionTitles[i]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)  {
                actionHandler(action, i);
            }];
            [alertViewController addAction:action];
        }
    }
    if (withCancelButton) {
        [alertViewController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    }
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertViewController animated:YES completion:nil];
}
@end
