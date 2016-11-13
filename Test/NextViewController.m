//
//  NextViewController.m
//  Test
//
//  Created by zhajianjun on 16/11/6.
//  Copyright © 2016年 TTanys. All rights reserved.
//

#import "NextViewController.h"
#import "LastViewController.h"

@interface NextViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    dispatch_group_t group = dispatch_group_create();
//    for(int i = 0; i< 100; ++i) {
//        dispatch_group_async(group, queue, ^{
//            [array addObject:[NSNumber numberWithInt:i]];
//        });
//    }
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    NSLog(@"%@",  @([array count]));
    
    dispatch_queue_t dispatchQueue = dispatch_queue_create("ted.queue.next", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        NSLog(@"dispatch-1");
    });
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        NSLog(@"dspatch-2");
    });
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
        NSLog(@"end");
    });
    
}
- (IBAction)buttonClicked {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)searchBtnClicked:(id)sender {
    
    int x[10] = {1, 5, 6, 13, 45, 50, 70, 123, 456, 1001};
    //二分查找-递归方法
    int findNumLocation1 = binarySearch1(x, 0, 9, 13);
    //二分查找-非递归方法
    int findNumLocation2 = binarySearch2(x, 0, 9, 1001);
    NSLog(@"%@findNumLocation1:%d",((UIButton *)sender).currentTitle, findNumLocation1);
    NSLog(@"%@findNumLocation2:%d",((UIButton *)sender).currentTitle, findNumLocation2);
    
    //冒泡排序
    int y[11] = {20, 5, 66, 13, 1, 50, 17, 101010, 456, 89, 891228};
    bubble_sort(y, 11);
    showArray(y, 11);
    
    //选择排序
    int z[11] = {20, 5, 66, 13, 1, 50, 17, 101010, 456, 89, 891228};
    quickSort(z, 0, 11);
    showArray(z, 11);
    
    //快速排序
    int w[11] = {20, 5, 66, 13, 1, 50, 17, 101010, 456, 89, 891228};
    selectSort(w, 11);
    showArray(w, 11);
    
    LastViewController *lastVc = [[LastViewController alloc] init];
    [self presentViewController:lastVc animated:YES completion:nil];
}

//二分查找 θ(logn)

 //递归方法
int binarySearch1(int a[] , int low , int high , int findNum)
{
    int mid = ( low + high ) / 2;
    if (low > high)
        return -1;
    else
    {
        if (a[mid] > findNum)
            return binarySearch1(a, low, mid - 1, findNum);
        else if (a[mid] < findNum)
            return binarySearch1(a, mid + 1, high, findNum);
        else
            return mid;
    }
}

 //非递归方法
int binarySearch2(int a[] , int low , int high , int findNum)
{
    while (low <= high)
    {
        int mid = ( low + high) / 2;   //此处一定要放在while里面
        if (a[mid] < findNum)
            low = mid + 1;
        else if (a[mid] > findNum)
            high = mid - 1;
        else
            return mid;
    }
    return  -1;
}


 //冒泡排序   θ(n^2)
void bubble_sort(int a[], int n)
{
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {//外层循环每循环一次就能确定出一个泡泡（最大或者最小），所以内层循环不用再计算已经排好的部分
            if(a[j] > a[j + 1]) {
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
}

 //选择排序
void selectSort(int a[], int n)
{
    for (int i = 0; i < n-1; i++) {
        for (int j = i+1; j < n; j++) {
            if (a[i] < a[j]) {
                int temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
    }
}

 //快速排序  调用方法  quickSort(a,0,n);  θ(nlogn)
void quickSort (int a[] , int low , int high)
{
    if (high < low + 2)
        return;
    int start = low;
    int end = high;
    int temp;
    
    while (start < end)
    {
        while ( ++start < high && a[start] <= a[low]);//找到第一个比a[low]数值大的位子start
        
        while ( --end  > low  && a[end]  >= a[low]);//找到第一个比a[low]数值小的位子end
        
        //进行到此，a[end] < a[low] < a[start],但是物理位置上还是low < start < end，因此接下来交换a[start]和a[end],于是[low,start]这个区间里面全部比a[low]小的，[end,hight]这个区间里面全部都是比a[low]大的
        
        if (start < end)
        {
            temp = a[start];
            a[start]=a[end];
            a[end]=temp;
        }
        //在GCC编译器下，该写法无法达到交换的目的，a[start] ^= a[end] ^= a[start] ^= a[end];编译器的问题
    }
    //进行到此，[low,end]区间里面的数都比a[low]小的,[end,higt]区间里面都是比a[low]大的，把a[low]放到中间即可
    
    //在GCC编译器下，该写法无法达到交换的目的，a[low] ^= a[end] ^= a[low] ^= a[end];编译器的问题
    
    temp = a[low];
    a[low]=a[end];
    a[end]=temp;
    
    //现在就分成了3段了，由最初的a[low]枢纽分开的
    quickSort(a, low, end);
    quickSort(a, start, high);
}


//打印数组
void showArray(int x[],int n)
{
    for (int i=0; i<n; i++) {
        printf("%d ",x[i]);
    }
    printf("\n");
}

@end
