#!/bin/bash

last_dir=""
while :; do
  echo "分析懒人脚本by damin/hongjie修改"
  echo "请输入运行目录（为空则默认上次目录）："
  read -p "目录： " dir
  if [ -z "$dir" ]; then
    if [ -f "last_dir.txt" ]; then
      dir=$(cat last_dir.txt)
    else
      echo "未检测到历史目录，请先指定目录！"
      continue
    fi
  fi
  echo "$dir" > last_dir.txt
  echo "请选择操作："
  echo "0. 下载文件"
  echo "1. 全分析"
  echo "2. 合并"
  echo "3. 蛋白质处理"
  echo "4. R语言"
  read -p "请输入选项： " option0

  case $option0 in
    0)
      wget  https://raw.githubusercontent.com/hongjiezhao20/-/refs/heads/main/ananlysisdocument1.3.zip-O adz1.3.zip
      unzip adz1.3.zip -d "$dir"
      echo "分析文件已下载并解压至 $dir"
      ;;
    1)
      cd $dir
      chmod +x combine1.sh
      chmod +x combine2.sh
      chmod +x combine3.sh
      chmod +x protein_ca.sh
      chmod +x protein_dry.sh
      ./combine1.sh
      ./combine2.sh
      ./combine3.sh
      ./protein_ca.sh
      ./protein_dry.sh
      ./rmsd.R
      ./rmsf.R
      ./dccm_md.R
      ;;
    2)
      echo "请选择操作："
      echo "1. 三文件合并"
      echo "2. α碳合并"
      echo "3. 全合并"
      echo "4. 去水离子"
      echo "5. 返回上一步"
      read -p "请输入选项：" option02
      ;;
    3)
      echo "请选择操作："
      echo "1. α碳化和干化"
      echo "2. α碳化"
      echo "3. 干化"
      echo "4. 返回上一步"
      read -p "请输入选项：" option03
      ;; 
    4)
      echo "请选择操作："
      echo "1. 全部"
      echo "2. rmsd"
      echo "3. rmsf"
      echo "4. dccm_md"
      echo "5. 返回上一步"
      read -p "请输入选项：" option04
      ;;	  
    *)
      echo "无效选项，请重新输入！"
      ;; 
  esac
   case $option02 in
     1)
       cd $dir
       chmod +x combine1.sh
       chmod +x combine2.sh
       chmod +x combine3.sh
       ./combine1.sh
       ./combine2.sh
       ./combine3.sh
       ;;
     2)
       cd $dir
       chmod +x combine1.sh
       ./combine1.sh
       ;;
     3)
       cd $dir
       chmod +x combine2.sh
       ./combine2.sh
       ;;
     4)
       cd $dir
       chmod +x combine3.sh
       bash combine3.sh
       ;;
     5)
       return
       ;;
     *)
       echo "无效选项，请重新输入！"
       ;;
  esac
  case $option03 in
    1)
      cd $dir
      chmod +x protein_ca.sh
      chmod +x protein_dry.sh
      ./protein_ca.sh
      ./protein_dry.sh
      ;;
    2)
      cd $dir
      chmod +x protein_ca.sh
      ./protein_ca.sh
      ;;
    3)
      cd $dir
      chmod +x protein_dry.sh
      ./protein_dry.sh
      ;;
    4)
      return
      ;;
    *)
      echo "无效选项，请重新输入！"
      ;;
 esac 
  case $option04 in
    1)
      cd $dir
      chmod +x rmsd.R
      chmod +x rmsf.R
      chmod +x dccm_md.R
      ./rmsd.R
      ./rmsf.R
      ./dccm_md.R
      ;;
    2)
      cd $dir
      chmod +x rmsd.R
      ./rmsd.R
      ;;
    3)
      cd $dir
      chmod +x rmsf.R
      ./rmsf.R
      ;;
    4)
      cd $dir
      chmod +x dccm_md.R
      ./dccm_md.R
      ;;
    5)
      return 
      ;;
    *)
      echo "无效选项，请重新输入！"
      ;;
  esac
done


