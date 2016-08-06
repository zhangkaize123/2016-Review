//
//  ViewController.m
//  使用TBXml解析
//
//  Created by 张凯泽 on 15/11/24.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "TBXML.h"
#import "ZKZAuthor.h"
#import "ZKZBook.h"
@interface ViewController ()
@property(nonatomic,strong)TBXML *tbXml;
//@property(nonatomic,strong)NSMutableArray *books;//书籍的数组
@property(nonatomic,strong)NSMutableArray *authors;//作者数组

@end

@implementation ViewController
@synthesize tbXml;
@synthesize authors;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    tbXml = [[TBXML alloc]initWithXMLFile:@"books2.xml" error:&error];
    //[self startTBXml:tbXml];
    //[self dealUnknow:tbXml];
    //把XML数据转化成模型
    [self loadArticles:tbXml];
    
    
    
}
-(void)startTBXml:(TBXML*)tbXml
{
    
    TBXMLElement *root = tbXml.rootXMLElement;
    TBXMLElement *author = [TBXML childElementNamed:@"author" parentElement:root];
    NSString *name = [TBXML valueOfAttributeNamed:@"name" forElement:author];
    NSLog(@"author:%@", name);
    TBXMLElement *book = [TBXML childElementNamed:@"book" parentElement:author];
    NSString *title = [TBXML valueOfAttributeNamed:@"title" forElement:book];
    NSLog(@"title:%@", title);
    NSString *price = [TBXML valueOfAttributeNamed:@"price" forElement:book];
    NSLog(@"price:%@", price);
    TBXMLElement *descriptionElem = [TBXML childElementNamed:@"description" parentElement:book];
    NSString * description = [TBXML textForElement:descriptionElem];
    NSLog(@"author:%@", description);
}

- (void)dealUnknow:(TBXML *)tbx {
    if (tbx.rootXMLElement) {
        TBXMLElement *element = tbx.rootXMLElement;
        [self recurrence:element];
    }
    else {
        NSLog(@"Format Error!");
    }
    tbXml = nil;
}
//递归子方法
- (void)recurrence:(TBXMLElement *)element {
    do {
        
        NSLog(@"<%@>:{%@}",[TBXML elementName:element], [TBXML textForElement:element]);// Display the name of the element
        
        //迭代处理所有属性
        TBXMLAttribute * attribute = element->firstAttribute;
        while (attribute) {
            //显示
            NSLog(@"___****___<%@>->[%@ = %@]", [TBXML elementName:element], [TBXML attributeName:attribute], [TBXML attributeValue:attribute]);
            
            //迭代
            attribute = attribute->next;
        }
        
        //递归处理子树
        if (element->firstChild) {
            [self recurrence:element->firstChild];
        }
        
        //迭代处理兄弟树
    } while ((element = element->nextSibling)); 
}
#pragma mark---zkz--把XML数据转化成数据模型
- (void)loadArticles:(TBXML*)tbxml {
    TBXMLElement *root = tbxml.rootXMLElement;//articles
    if (root)
    {
        authors = [NSMutableArray array];//作者数组
        TBXMLElement *channel = [TBXML childElementNamed:@"author" parentElement:root];//作者
        
        while (channel) {
            NSString *name = [TBXML valueOfAttributeNamed:@"name" forElement:channel];//作者名字
            ZKZAuthor * author = [[ZKZAuthor alloc]init];//创建作者模型
            author.authorName = name;
            if (channel)
            {
                NSMutableArray *books = [NSMutableArray array];//书籍数组
                TBXMLElement *item = [TBXML childElementNamed:@"book" parentElement:channel];//书籍
                while (item)
                {
                    ZKZBook * book = [[ZKZBook alloc]init];//创建书籍模型
                    //书的名字
                    NSString *title = [TBXML valueOfAttributeNamed:@"title" forElement:item];
                    book.title = title;
                    //书的价格
                    NSString *price = [TBXML valueOfAttributeNamed:@"price" forElement:item];
                    book.price = price;
                    TBXMLElement *descriptionElem = [TBXML childElementNamed:@"description" parentElement:item];//书的描述
                    NSString * description = [TBXML textForElement:descriptionElem];
                    book.descriptionStr = description;
                    [books addObject:book];
                    //寻找下一个书籍
                    item = [TBXML nextSiblingNamed:@"book" searchFromElement:item];
                }
                author.books = books;
            }
            [authors addObject:author];
            //寻找下一个作者
            channel = [TBXML nextSiblingNamed:@"author" searchFromElement:channel];
        }
    }
    for (ZKZAuthor * author  in authors) {
        NSLog(@"authorName = %@",author.authorName);
        for (ZKZBook * book in author.books) {
            NSLog(@"title = %@",book.title);
            NSLog(@"price = %@",book.price);
            NSLog(@"descriptionStr = %@",book.descriptionStr);
        }
    }
    
    tbxml = nil;
}
@end
