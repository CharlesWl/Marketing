//
//  main.c
//  基本算法
//
//  Created by charles on 16/7/11.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#include <stdio.h>
#include "math.h"
/**
 *  水仙花数
 */
void shuiXianHuaShu() {
    printf("******水仙花数******\n");
    /*“水仙花数”是指一个三位数，其各位
     数字立方和等于该数本身。例如：153是一个“水仙花数”，因为153=1的三次方
     ＋5的三次方＋3的三次方。*/
    for (int shui = 100; shui < 1000; shui ++) {
        //百位数
        int bai = shui/100;
        //十位数
        int shi = shui/10%10;
        //个位数
        int ge = shui%10;
        if (shui == bai*bai *bai + shi *shi *shi + ge *ge *ge ) {
            printf("水仙花数:%-5d",shui);
        }
    }
}

/**
 *  质数
 */
void zhiShu() {
    printf("******判断质数******\n");
    /*程序分析：判断素数的方法：用一个数分别去除2到sqrt(这个数)，如果能被整
     除，则表明此数不是素数，反之是素数。*/
    int m,i,k,h=0,leap=1;
    printf("\n");
    for(m=101;m<=200;m++){
        k = sqrt (m+1);
        for(i=2;i<=k;i++)
        if(m%i==0){leap=0;break;}
        if(leap) {
            printf("%-4d",m);h++;
            if(h%10==0)
            printf("\n");
        }
        leap=1;
        }
    printf("\nThe total is %d",h);
}

/**
 *  求最小公倍数和最大公约数三种方法
 */
void gongBeiShuAndGongyueShu () {
    /*最小公倍数：数论中的一种概念，两个整数公有的倍数成为他们的公倍数，其中一个最小的公倍数是他们的最小公倍数，同样地，若干个整数公有的倍数中最小的正整数称为它们的最小公倍数
       最小公倍数=两整数的乘积÷最大公约数
       最大公约数算法：1.辗转相除法 2.相减法 3.穷举法*/
    int m, n, a, b, c;
    printf("Input two integer numbers:\n");
    scanf("%d%d", &a, &b);
    m=a;   n=b;
    while(b!=0)  /* 余数不为0，继续相除，直到余数为0 */
    { c=a%b;
       a=b;
       b=c;
    }
    printf("The largest common divisor:%d\n", a);
    printf("The least common multiple:%d\n", m*n/a);
}

int main(int argc, const char * argv[]) {
    /**
     *  水仙花数
     */
    shuiXianHuaShu();
    /**
     *  求质数（素数）
     */
    zhiShu();
    
    return 0;
}

