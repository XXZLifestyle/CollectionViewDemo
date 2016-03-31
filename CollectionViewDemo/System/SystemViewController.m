//
//  SystemViewController.m
//  CollectionViewDemo
//
//  Created by Jiayu_Zachary on 15/12/16.
//  Copyright © 2015年 Zachary. All rights reserved.
//

#import "SystemViewController.h"
#import "SystemCell.h"

NSString *const systemIdentifier = @"systemIdentifier";
NSString *const customSystemIdentifier = @"customSystemIdentifier";
NSString *const headerViewIdentifier = @"headerViewIdentifier";
NSString *const footerViewIdentifier = @"footerViewIdentifier";

@interface SystemViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *systemCollectionView;

@end

@implementation SystemViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildLayout];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 2) {
        return 3;
    }
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:systemIdentifier forIndexPath:indexPath];
    
    UILabel *content = [[UILabel alloc] init];
    content.frame = CGRectMake(100, (cell.frame.size.height-50)/2, cell.frame.size.width-100*2, 50);
    content.text = @"content";
    content.textAlignment = NSTextAlignmentCenter;
    content.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:content];
    
    //1 - 选中cell的背景色
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = view;
    
    //2 - cell背景色
    //2.1
    //cell.backgroundColor = [UIColor blackColor];
    //2.2
    //cell.contentView.backgroundColor = [UIColor blueColor];
    //2.3
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor whiteColor];
    cell.backgroundView = view1;
    
    //3 - 选中的cell
    if (indexPath.row == 3) {
//        cell.selected = YES;
    }
    
    //4 - 高显的cell
    if (indexPath.row == 5) {
//        cell.highlighted = YES;
    }
    
    
    if (indexPath.section ==  2) {
        SystemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:customSystemIdentifier forIndexPath:indexPath];
        
        //绑定
        [cell systemCellWithIndex:indexPath.row dictionary:nil];
        
        return cell;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
//cell可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return NO;
    }
    
    return YES;
}

//cell被选择时被调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    XXZLog(@"section = %ld, row = %ld", indexPath.section, indexPath.row);
}

//cell反选时被调用(多选时才生效)
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    XXZLog(@"didDeselectItemAtIndexPath");
}

#pragma mark - UICollectionViewDelegateFlowLayout
//每个cell的宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH-20, 200);
}

//设置每组的cell的上下左右边界
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //上, 左, 下, 右
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}

//cell的最小列间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {}

#if 1
//定义并返回每个headerView或footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headerView = nil;
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) { //头视图
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor clearColor];
        
        
        UILabel *title = [[UILabel alloc] init];
        title.frame = CGRectMake(15, 5, headerView.frame.size.width-15*2, headerView.frame.size.height-10);
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor blackColor];
        title.text = @"headerView";
        title.textAlignment = NSTextAlignmentCenter;
//        [headerView addSubview:title];
    }
    else if ([kind isEqualToString: UICollectionElementKindSectionFooter]) { //脚视图
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerViewIdentifier forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor magentaColor];
        
        UILabel *title = [[UILabel alloc] init];
        title.frame = CGRectMake(15, 5, headerView.frame.size.width-15*2, headerView.frame.size.height-10);
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor blackColor];
        title.text = @"footerView";
        title.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:title];
    }
    
    return headerView;
}

/*
    1 - 上面这个方法使用时必须要注意的一点是，如果布局没有为headerView或footerView设置size的话(默认size为CGSizeZero)，则该方法不会被调用。
        所以如果需要显示header或footer，需要手动设置size。
    2 - 可以通过设置UICollectionViewFlowLayout的headerReferenceSize和footerReferenceSize属性来全局控制size。
        或者通过重载以下代理方法来分别设置
 */

//头视图宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 10);
}

//脚视图宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return CGSizeMake(0, 30);
    return CGSizeZero;
}
#endif

#pragma mark - action


#pragma mark - build layout
- (void)buildLayout {
    [self.view addSubview:self.systemCollectionView];
    [self registerClass:_systemCollectionView];//注册
}

//注册
- (void)registerClass:(UICollectionView *)collectionView {
    //注册cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:systemIdentifier];
    [collectionView registerClass:[SystemCell class] forCellWithReuseIdentifier:customSystemIdentifier];
    
    //注册头视图
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    //注册脚视图
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerViewIdentifier];
}

#pragma mark - getter
- (UICollectionView *)systemCollectionView {
    if (_systemCollectionView == nil) {
        //UICollectionViewLayout 界面布局类
        //网格布局类, 继承UICollectionViewLayout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
        
        _systemCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        
        _systemCollectionView.backgroundColor = UICOLOR_FROM_BACKGROUND;
        _systemCollectionView.delegate = self;
        _systemCollectionView.dataSource = self;
    }
    return _systemCollectionView;
}

#pragma mark - dealloc
- (void)dealloc {
    
}

#pragma mark - other
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
