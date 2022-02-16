import os
from PIL import Image
from termcolor import cprint


TITLE = """
  _                   _                         _ _ 
 (_)_ __ ___   __ _  | |_ ___     __ _ ___  ___(_|_)
 | | '_ ` _ \ / _` | | __/ _ \   / _` / __|/ __| | |
 | | | | | | | (_| | | || (_) | | (_| \__ \ (__| | |
 |_|_| |_| |_|\__, |  \__\___/   \__,_|___/\___|_|_|
              |___/                                 
"""

CHOICE = """
0 - Help
1 - Convert one image
2 - Convert all images from /img folder
3 - Exit

"""

HELP = """
This script takes images from the folder /img and saves them as ascii art on the folder /txt

User input -------------------------

    Image name - The name of the image to be converted. Must include extension. Ex: test.png

    Width - The width of the final image to be converted.

    Level of Detail - Increases the amount of blank spaces dedicated to darker colors. Optimal value changes from image to image.

You can check inside the /txt folder to see examples of the 3 levels of detail.
"""

CHARS = [" .:-=+*#%@","      .:-=+*#%@","            .:-=+*#%@"]

def resizeImg(img, new_width=100):
    char_h = 8;
    char_w = 18

    width, height = img.size
    ratio = height / width
    new_height = int(new_width * ratio * char_h / char_w)
    resized_img = img.resize([new_width, new_height])
    return resized_img


def grayscaler(has_alpha, pix, i, j):
    if has_alpha:
        r,g,b,a = pix[j,i]
    else:
        r,g,b = pix[j,i]

    h = int((r + g + b)/3)
    pix[j, i] = (h, h, h)
    
    return h


def getChar(depth, input):
    if depth == 2:
        charArray = list(CHARS[1])
    elif depth == 3:
        charArray = list(CHARS[2])
    else:
        charArray = list(CHARS[0])

    charLen = len(charArray)        
    # assigns a brightness range for each character in charArray
    interval = charLen/256                              

    return charArray[int(input*interval)]


def toAscii(has_alpha, depth, path, img):
    img_format = path[-3:]
    name = path[4:].replace(path[-3:],'txt')
    txt_path = "txt/" + name
    
    text = open(txt_path, "w")
    width, height = img.size
    pix = img.load()

    for i in range(height):
        for j in range(width):
            text.write(getChar(depth, grayscaler(has_alpha,pix,i,j)))
        text.write('\n')

def clearScreen(n):
    for i in range(n):
        print()

def main():
    print(TITLE)

    val = 0

    while val == 0:
        choice = int(input(CHOICE))
        if choice == 1 or choice == 2:
            val = 1
        elif choice == 0:
            clearScreen(60)
            print(HELP)
        elif choice == 3:
            input("\nPress enter to exit.")
            exit()
        else:
            clearScreen(60)
            cprint("Invalid input. Try again","red")

    val = 0
    # ---------------------------------------------------- Convert one image
    if(choice == 1):
        # ------------------------------------------------ Validate Image name
        while val == 0:
            path = input("\nInsert image name:\n")
            path = 'img/' + path
            try:
                img = Image.open(path, 'r')
            except:
                cprint("\nThat is not a valid name.",'red')
            else:
                has_alpha = img.mode == 'RGBA'
                val = 1

        val = 0   
        # ------------------------------------------------ Validate Image width
        while val == 0: 
            try:
                width = int(input("\nInsert desired width [50-1000]:\n"))
            except:
                cprint("\nThat is not a valid width.",'red')
            else:
                if width > 1000 or width < 50:
                    cprint("\nThat is not a valid width.",'red')
                else:
                    val = 1 

        val = 0
        # ------------------------------------------------ Validate LoD
        while val == 0: 
            try:
                depth = int(input("\nInsert desired level of detail [1-3]:\n"))
            except:
                cprint("\nThat is not a valid LOD.",'red')
            else:
                val = 1
        
        toAscii(has_alpha, depth, path, resizeImg(img, width))
        input("\nDone. Press enter to exit.")

    # ---------------------------------------------------- Convert all images
    else:
        val = 0
        # ------------------------------------------------ Validate Image width
        while val == 0: 
            try:
                width = int(input("\nInsert desired width [50-1000]:\n"))
            except:
                cprint("\nThat is not a valid width.",'red')
            else:
                if width > 1000 or width < 50:
                    cprint("\nThat is not a valid width.",'red')
                else:
                    val = 1 

        val = 0
        # ------------------------------------------------ Validate LoD
        while val == 0: 
            try:
                depth = int(input("\nInsert desired level of detail [1-3]:\n"))
            except:
                cprint("\nThat is not a valid LOD.",'red')
            else:
                val = 1

        # ------------------------------------------------ Get all images
        path = os.path.normpath(str(os.getcwd()) + '\\img')
        files = [file for file in os.listdir(path) if file != 'Place your images here.txt']

        # ------------------------------------------------ Convert each image
        for count, file in enumerate(files, start=1):
            path = 'img/' + file
            img = Image.open(path, 'r')
            has_alpha = img.mode == 'RGBA'
            toAscii(has_alpha, depth, path, resizeImg(img, width))

        input(f"\n{count} images were converted. Press enter to exit.")
            
if __name__ == "__main__":
    main()
