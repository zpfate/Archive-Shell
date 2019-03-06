#!/bin/bash

Project_Path=$( cd "$( dirname $0)" & pwd)

# echo $Project_Path

Project_Name=ArchieveAutomiclly
Target_Name=ArchieveAutomiclly

xcodebuild clean -configuration "$configuration" -target "$Project_Name"

#工程文件路径
APP_PATH="${Project_Path}/${Project_Name}.xcodeproj"

# 归档路径
ARCHIVE_PATH="${Project_Path}/archive/${Target_Name}.xcarchive"
# 编译环境
CONFIGURATION=Debug
# 导出路径
EXPORT_PATH="${Project_Path}/archive/${Target_Name}"
# plist路径
PLIST_PATH="${Project_Path}/ExportOptions.plist"

# archive
xcodebuild archive -project "${APP_PATH}" -scheme "${Target_Name}" -configuration "${CONFIGURATION}" -archivePath "${ARCHIVE_PATH}" 
# 导出ipa
xcodebuild -exportArchive -archivePath "${ARCHIVE_PATH}" -exportPath "${EXPORT_PATH}" -exportOptionsPlist "${PLIST_PATH}"
