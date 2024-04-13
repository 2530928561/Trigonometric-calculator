##########
# 项目名称：Trigonometric-calculator
# 最终版本：V2.0
# 修订时间：2024/4/15
# 小组成员：王恕欣，王明宇，周诗瑶，赵之喻
# 程序说明: 测试函数
##########



import math
import time
import unittest
from function.trigonomtric import my_sin,my_cos,my_tan,my_cot
from function.anti_trigonomtric import my_arcsin,my_arctan,my_arccos

#---------------------------------测试函数定义----------------------------------#
def test_sin(angle=30,err=0.0001):
    print(f"test_sin,angle:{angle}")
    print(f"my_sin:{my_sin(angle)}")
    if abs(my_sin(angle) - math.sin(math.radians(angle)) )< err:
        print("correct result\n")
    else:
        print("wrong result\n")

def test_cos(angle=30,err=0.0001):
    print(f"test_cos,angle:{angle}")
    print(f"my_cos:{my_cos(angle)}")
    if abs(my_cos(angle) - math.cos(math.radians(angle)) )< err:
        print("correct result\n")
    else:
        print("wrong result\n")

def test_tan(angle=30,err=0.0001):
    print(f"test_tan,angle:{angle}")
    print(f"my_tan:{my_tan(angle)}")
    if abs(my_tan(angle) - math.tan(math.radians(angle)) )< err:
        print("correct result\n")
    else:
        print("wrong result\n")



def test_arcsin(value=0.7071, err=0.0001):
    print(f"test_arcsin,angle:{value}")
    print(f"my_arcsin:{my_arcsin(value,10)}")
    if abs(my_arcsin(value,10) - math.asin(value)) < err:
        print("correct result\n")
    else:
        print("wrong result\n")


def test_arccos(value=0.7071, err=0.0001):
    print(f"test_arcocs,angle:{value}")
    print(f"my_arccos:{my_arccos(value,10)}")
    if abs(my_arccos(value,10) - math.acos(value)) < err:
        print("correct result\n")
    else:
        print("wrong result\n")


def test_arctan(value=0.7071, err=0.0001):
    print(f"test_arctan,angle:{value}")
    print(f"my_arctan:{my_arctan(value,10)}")
    if abs(my_arctan(value,10) - math.atan(value)) < err:
        print("correct result\n")
    else:
        print("wrong result\n")



if __name__ == "__main__":

    # 参考误差设定
    err = 0.0001

    # sin、cos、tan参考角度
    angle = 30
    angle_30 = 30
    angle_60 = 60
    angle_90 = 90
    angel_390 = 390

    # arcsin、arccos、arctan参考数值
    value_0 = 0
    value_1 = 0.7071
    value_2 = 0.8660
    value_3 = 0.5773

    choose = input("please enter 'all' or 'single' to choose your test:\n")         #选择两种不同的验证模式
    if choose == "all":
        start_time = time.time()
        test_sin(angle_30, err)
        test_cos(angle_90, err)
        test_tan(angle_30, err)
        test_arcsin(value_1, err)
        test_arccos(value_1, err)
        test_arctan(value_1, err)
        end_time = time.time()
        print(f"total time consume:{end_time - start_time}")                        #显示总共消耗的时间
    elif choose == "single" :
        user_input = input("Enter the range of error you can accept, which is at least 0.0001:\n")
        if user_input == "my_sin":
            test_sin(angle_90, err)
        elif user_input == "my_cos":
            test_cos(angle_30, err)
        elif user_input == "my_tan":
            test_tan(angle_30, err)
        elif user_input == "my_arcsin":
            test_arcsin(2, err)
        elif user_input == "my_arccos":
            test_arccos(value_1, err)
        elif user_input == "my_arctan":
            test_arctan(value_1, err)
        else:
            print("wrong input,please try again")
    else:
        print("wrong input,please try again")




