//
//  ViewController.m
//  FMDBHandler
//
//  Created by GGT on 2018/7/6.
//  Copyright © 2018年 GGT. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "FMDBHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *person = [[Person alloc] init];
    person.age = 10;
    person.name = @"Tom";
    person.number = @20;
    person.numberArray = @[@1, @"43", [NSDate date]];
    Person *son = [Person new];
    son.age = 10;
    son.name = @"tom";
    person.son = son;
    [[FMDBHandler shareInstance] insertData:person tableName:@"Person"];
//    [[FMDBHandler shareInstance] deletedDataWithTableName:@"Person" columnNames:@[@"name", @"number"] values:@[@"Jack", @20]];
    
//    [[FMDBHandler shareInstance] updateDataWithTableName:@"Person" columnName:@"id" value:@1 updateColumnName:@"name" updateValue:@"Hello"];
//    [[FMDBHandler shareInstance] updateDataWithTableName:@"Person" columnNames:@[@"id", @"name"] columnValues:@[@1, @"渣渣"] updateColumnNames:@[@"number", @"testNumber"] updateColumnValues:@[@1, @1]];
//    NSArray *personArray = [[FMDBHandler shareInstance] getAllDataWithTableName:@"Person" classObject:[Person class]];
    NSArray *personArray = [[FMDBHandler shareInstance] getDataWithTableName:@"Person" classObject:[Person class] columnNames:@[@"age", @"name"] columnValues:@[@10, @"Jack"] whereType:FMDBHandlerWhereSQLTypeOr];
    NSLog(@"%@", personArray);
}


@end
