import time
from random import randint


for i in range(1,85):
    print('')

space = ''


for i in range(1,1000):
    count = randint(1, 100)
    while(count > 0):
        space += ' '
        count -= 1

    if(i%10==0):
        print(space + 'Happy New Year 2079🎉')
    elif(i%9 == 0):
        print(space + "🪅")
    elif(i%5==0):
        print(space +"🎈❤")
    elif(i%8==0):
        print(space + "🎈💕")
    elif(i%7==0):
        print(space + "🍁🥰🥰")
    elif(i%6==0):
        print(space + "नया वर्ष को धरै धरै सुभकामना!!!")
    else:
        print(space + "🔸")

    space = ''
    time.sleep(0.2)
