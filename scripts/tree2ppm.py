import sys
import random
from PIL import Image, ImageDraw
#from tkinter import *


with open(sys.argv[1], 'r') as f:
    lines = f.readlines()
    height = len(lines)
    width = len(lines[0]) - 1

print(width, height)

img = Image.new('RGBA', (width * 10, height * 10))
d = {'f': '../textures/f',
     'F': '../textures/F',
     't': '../textures/t',
     'T': '../textures/T',
     'o': '../textures/o',
     'r': '../textures/r',
     '-': '../textures/u',
     ' ': '../textures/a'}

x = 0
y = 0
draw = ImageDraw.Draw(img)

world = []
for line in lines:
    current_line = []
    for c in line:
        if c != '\n':
            current_line.append(c)
    world.append(current_line)
print(world)

for y, line in enumerate(world):
    for x, c in enumerate(line):
    #print(line)
    #for x in range(width):
        #print(x,y)
        green = int((255.0 / height) * y)
        if c == ' ':
            draw.rectangle((x * 10, y * 10, (x+1) * 10, (y+1) * 10), (0,green,255))
        elif c != '\n':
            ind = random.randint(1,3)
            current_sprite = Image.open(d[line[x]] + str(ind) + '.png')
            img.paste(current_sprite, (x * 10, y * 10))

img.save('res.png', 'png')
img.show()
'''
        elif c == 'f':
            if x > 0 and y > 0 and x < width - 1 and y < height - 1:
                if (world[x-1][y] == ' ' and world[x][y-1] == ' ' and world[x-1][y-1] == ' '
                    and world[x+1][y] == 'f' and world[x][y+1] == 'f'):
                    current_sprite_i = Image.open('../textures/f_nwi.png')
                    current_sprite = Image.open('../textures/f_nw.png')
                elif (world[x+1][y] == ' ' and world[x][y-1] == ' ' and world[x+1][y-1] == ' '
                    and world[x-1][y] == 'f' and world[x][y+1] == 'f'):
                    current_sprite_i = Image.open('../textures/f_nei.png')
                    current_sprite = Image.open('../textures/f_ne.png')
                elif (world[x+1][y] == ' ' and world[x][y+1] == ' ' and world[x+1][y+1] == ' '
                    and world[x-1][y] == 'f' and world[x][y-1] == 'f'):
                    current_sprite_i = Image.open('../textures/f_sei.png')
                    current_sprite = Image.open('../textures/f_se.png')
                elif (world[x-1][y] == ' ' and world[x-1][y-1] == ' ' and world[x][y-1] == ' '
                    and world[x][y-1] == 'f' and world[x+1][y] == 'f'):
                    current_sprite_i = Image.open('../textures/f_swi.png')
                    current_sprite = Image.open('../textures/f_sw.png')
                else:
                    current_sprite = Image.open('../textures/f.png')
                    current_sprite_i = Image.open('../textures/blank.png')

                img.paste(current_sprite, (x * 10, y * 10))
                draw.bitmap((x * 10, y * 10), current_sprite_i, fill=(0,green,255))

'''
