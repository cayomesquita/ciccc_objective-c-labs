//
//  main.m
//  proj
//
//  Created by Cornerstone on 2020-06-08.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    const NSString *EXIT = @"q";
    
    @autoreleasepool {
        char inputChars[255];
        for (; ; ) {
            printf("Input a string: ");
            fgets(inputChars, 255, stdin);
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            
            if ([inputString length] > 0) {
                for (; ; ) {
                    printf("Input an operation: \n");
                    printf("1-Uppercase\n2-Lowercase\n3-Numberize\n");
                    printf("4-Canadianize\n5-Respond\n6-De-Space-It\n");
                    printf("q-exit\n");
                    printf("Choose one: \n");
                    fgets(inputChars, 255, stdin);
                    NSString *inputOperationStr = [NSString stringWithUTF8String:inputChars];
                    inputOperationStr = [inputOperationStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    if ([[EXIT uppercaseString] isEqualToString:[inputOperationStr uppercaseString]]){
                        printf("Bye!!\n");
                        exit(0);
                    }
                    switch ([inputOperationStr intValue]) {
                        case 1:
                            printf("%s\n", [[inputString uppercaseString] UTF8String]);
                            break;
                        case 2:
                            printf("%s\n", [[inputString lowercaseString] UTF8String]);
                            break;
                        case 3:
                            if( [[NSScanner scannerWithString:inputString] scanFloat:NULL] ){
                                printf("%d\n", [inputString intValue]);
                                break;
                            } else {
                                printf("Not a valid integer\n");
                                break;
                            }
                        case 4:
                            printf("%s, eh?\n", [inputString UTF8String]);
                            break;
                        case 5:
                            if ([inputString hasSuffix:@"?"]) {
                                printf("I don't know\n");
                                break;
                            }
                            if ([inputString hasSuffix:@"!"]) {
                                printf("Whoa, calm down!\n");
                                break;
                            }
                            printf("????\n");
                            break;
                        case 6:
                            printf("%s\n", [[inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"] UTF8String]);
                            break;

                        default:
                            printf("Invalid operation\n");
                            break;
                    }
                }
            } else {
                printf("Invalid input\n");
            }
        }
    }
    return 0;
}
