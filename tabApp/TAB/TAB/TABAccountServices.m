//
//  TABAccountServices.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABAccountServices.h"
#import "TABCreateAccountModel.h"

@implementation TABAccountServices

-(BOOL) signIn: (TABSignInModel *) signInModel {
 
    return TRUE;
}

-(BOOL) accountExists: (NSString *) path {
    
    NSError *error = nil;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return FALSE;
    }
    
    if(error){
        NSLog(@"Error creating accounts directory");
        return FALSE;
    }
    
    return TRUE;
}

-(BOOL) createAccount: (TABCreateAccountModel *) account {

    NSString *dataPath = [self getDataPathForAccount:account];
    
    if ([self accountExists:dataPath]) {
        return FALSE;
    }
    
    [NSKeyedArchiver archiveRootObject:account toFile:dataPath];
    
    return TRUE;
}

-(TABCreateAccountModel *) getAccount: (NSString *) email {
   
    return nil;
}

-(NSDictionary *) getAllAccounts {
    
    
    return nil;
}

-(NSString *) getDataPathForAccount: (TABCreateAccountModel *) account {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"/accounts"];
    
    NSError *error = nil;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    
    if(error){
        NSLog(@"Error creating accounts directory");
        return nil;
    }
    
    dataPath = [dataPath stringByAppendingPathComponent:account.email];
    dataPath = [dataPath stringByAppendingPathExtension:@"data"];
    NSLog(@"Path is : %@", dataPath);
    return dataPath;
}


@end
