from scipy import integrate #引入積分函式庫
import math
def function(t):
    return math.exp(-1 * (t ** 2 / 2))
def func(a,b):
    avg = 200   #Average平均數
    SD = 30     # Standard Deviation  標準差  
    ax = (a - avg) / SD
    bx = (b - avg) / SD
    ans,err = integrate.quad(function, ax, bx) #integrate.qud 單積分函數(積分函數名稱,上限,下限)
    ans_last= (1 / math.sqrt(2 * math.pi)) * ans

    return ans_last


a = float(input('請輸入反應時間：'))
b = float(input('到：'))
print(func(a,b))
