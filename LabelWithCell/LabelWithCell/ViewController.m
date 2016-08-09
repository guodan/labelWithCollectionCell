//
//  ViewController.m
//  LabelWithCell
//
//  Created by adan on 16/8/9.
//  Copyright © 2016年 adan. All rights reserved.
//

#import "ViewController.h"
#import "HotCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionV;

@property (nonatomic, strong)NSMutableArray *hotArray;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) collectionViewLayout:flowLayout];
    self.collectionV.delegate = self;
    self.collectionV.dataSource = self;
    //注册cell
    [self.collectionV registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"hotCell"];
    [self.view addSubview:self.collectionV];
    self.collectionV.backgroundColor = [UIColor grayColor];
    
    
}

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.hotArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotCell" forIndexPath:indexPath];
    cell.hotLabel.text = self.hotArray[indexPath.item];
    return cell;
}

- (CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = [self.hotArray[indexPath.item] sizeWithAttributes:NULL];
    //上面的是label的大小，需要修改为cell的大小
    size.height += 20;
    size.width += 20;
    return size;
}

- (NSMutableArray *)hotArray {
    if (!_hotArray) {
        _hotArray = [NSMutableArray new];
        [_hotArray addObjectsFromArray:@[@"金龙鱼大豆油",@"蒙牛牛奶",@"统一老坛酸菜牛肉面",@"伊利优酸乳",@"老干妈",@"波利鱼趣"]];
    }
    return _hotArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
