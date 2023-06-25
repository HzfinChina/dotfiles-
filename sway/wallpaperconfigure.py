#!/usr/bin/python3
import cv2
import os
import random
import subprocess
import time
import json

subprocess.run("swww init".split())
# 壁纸文件夹路径
image_path = "/home/hzf/Pictures/Wallpapers/"

# 亮度阈值
brightness_threshold = 100

# 读取所有壁纸文件，并移除 .brightness.json 文件
wallpapers = os.listdir(image_path)
wallpapers.remove(".brightness.json")
# 读取保存亮度数据的文件，如果不存在，则初始化一个空字典
brightness_file = os.path.join(image_path, ".brightness.json")
if os.path.exists(brightness_file):
    with open(brightness_file, "r") as f:
        brightness_dict = json.load(f)
else:
    brightness_dict = {}

# 计算新添加的壁纸的亮度并保存到字典中
for wallpaper in wallpapers:
    if wallpaper not in brightness_dict:
        img_path = os.path.join(image_path, wallpaper)
        img = cv2.imread(img_path)
        brightness = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY).mean()
        brightness_dict[wallpaper] = brightness

# 保存亮度数据到文件中
with open(brightness_file, "w") as f:
    json.dump(brightness_dict, f)

# 分类壁纸
bright_pictures = []
dark_pictures = []
for wallpaper, brightness in brightness_dict.items():
    if brightness > brightness_threshold:
        bright_pictures.append(wallpaper)
    else:
        dark_pictures.append(wallpaper)

# 主循环
i = 0
while True:
    # 获取当前时间
    current_time = time.localtime()
    hour = current_time.tm_hour

    # 判断白天还是黑夜
    if hour >= 7 and hour < 19:
        pictures = bright_pictures
    else:
        pictures = dark_pictures

    # 随机选择一张壁纸
    picture = random.choice(pictures)
    picture_path = os.path.join(image_path, picture)
    with open("/tmp/WallpaperNow.txt","w") as f:
        f.write(picture_path)

    # 调用swaybg更换壁纸
    command = ["swww","img",picture_path]
    print(command)
    process = subprocess.Popen(command)
    # 等待10分钟
    time.sleep(1000)

