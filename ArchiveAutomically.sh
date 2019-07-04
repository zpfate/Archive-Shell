#!/bin/zsh

# 获取当前目录, 请将脚本放置于workspace同级
PROJECT_PATH="$( cd "$( dirname "$0"  )" && pwd  )"

# 项目target名字
TARGET_NAME=$1

# 打包环境
CONFIGURATION=Release

#工程文件路径
# APP_PATH="${PROJECT_PATH}.xcodeproj"  #普通工程
APP_PATH="${PROJECT_PATH}/${TARGET_NAME}.xcworkspace"   #工作区

# Xcode clean
xcodebuild clean -workspace "${APP_PATH}" -configuration "${CONFIGURATION}" -scheme "${TARGET_NAME}"

# 打包目录
DESKTOP_PATH="~/Desktop"

# 时间戳
CURRENT_TIME=$(date "+%Y-%m-%d %H-%M-%S")

# 归档路径
ARCHIVE_PATH="${DESKTOP_PATH}/${TARGET_NAME} ${CURRENT_TIME}/${TARGET_NAME}.xcarchive"
# 编译环境
  
# 导出路径
EXPORT_PATH="${DESKTOP_PATH}/${TARGET_NAME} ${CURRENT_TIME}"

# plist路径
PLIST_PATH="${PROJECT_PATH}/ExportOptions.plist"

# archive 这边使用的工作区间 也可以使用project
xcodebuild archive -workspace "${APP_PATH}" -scheme "${TARGET_NAME}" -configuration "${CONFIGURATION}" -archivePath "${ARCHIVE_PATH}" 

# # 导出ipa
xcodebuild -exportArchive -archivePath "${ARCHIVE_PATH}" -exportPath "${EXPORT_PATH}" -exportOptionsPlist "${PLIST_PATH}"








#!/bin/zsh
# PROJECT_PATH=$1
# echo $PROJECT_PATH

# TARGET_NAME=$2

# CONFIGURATION=$3
# echo $CONFIGURATION

# if ! "$CONFIGURATION"; then
#     $CONFIGURATION=Build
# fi
# echo $CONFIGURATION

#工程文件路径
# APP_PATH="${PROJECT_PATH}.xcodeproj"  #普通工程
# # APP_PATH="${PROJECT_PATH}.xcworkspace"   #工作区

# # com.TwistedFate.www.ArchieveAutomic

# INFO_PATH="/Users/twistedfate/Desktop/TwistedFate/BlogDemo/ArchieveAutomiclly/ArchieveAutomiclly.xcodeproj/project.pbxproj"

# /usr/libexec/PlistBuddy -c 'Set :CFBundleIdentifier "com.TwistedFate.www.ArchieveAutomic" ' ${INFO_PATH}

# xcodebuild clean -project "${PROJECT_PATH}" -configuration "$configuration" -target "${TARGET_NAME}"

# # 归档路径
# ARCHIVE_PATH="${PROJECT_PATH}/archive/${TARGET_NAME}.xcarchive"
# # 编译环境
  

# # 导出路径
# EXPORT_PATH="${PROJECT_PATH}/archive/${TARGET_NAME}"
# # plist路径
# PLIST_PATH="${PROJECT_PATH}/ExportOptions.plist"

# # archive
# xcodebuild archive -project "${APP_PATH}" -scheme "${TARGET_NAME}" -configuration "${CONFIGURATION}" -archivePath "${ARCHIVE_PATH}" 
# # 导出ipa
# xcodebuild -exportArchive -archivePath "${ARCHIVE_PATH}" -exportPath "${EXPORT_PATH}" -exportOptionsPlist "${PLIST_PATH}"



