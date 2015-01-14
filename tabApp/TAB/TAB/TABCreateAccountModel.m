//
//  TABCreateAccountModel.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABCreateAccountModel.h"

@implementation TABCreateAccountModel

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [encoder encodeObject:self.zipCode forKey:@"zipCode"];
    [encoder encodeObject:self.dateOfBirth forKey:@"dateOfBirth"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    self.email = [decoder decodeObjectForKey:@"email"];
    self.password = [decoder decodeObjectForKey:@"password"];
    self.firstName = [decoder decodeObjectForKey:@"firstName"];
    self.lastName = [decoder decodeObjectForKey:@"lastName"];
    self.phoneNumber = [decoder decodeObjectForKey:@"phoneNumber"];
    self.zipCode = [decoder decodeObjectForKey:@"zipCode"];
    self.dateOfBirth = [decoder decodeObjectForKey:@"dateOfBirth"];
    
    return self;
}

@end
