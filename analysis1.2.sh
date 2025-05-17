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
      wget  -O model.zip
      unzip model.zip -d "$dir"
      echo "分析文件已下载并解压至 $dir"
      ;;
    1)
	 cd $dir
	 chmod +x combine1.sh
	 chmod +x combine2.sh
	 chmod +x combine3.sh
	 chmod +x protein_ca.sh
	 chmod +x protein_dry.sh
	 bash combine1.sh
	 bash combine2.sh
	 bash combine3.sh
	 bash protein_ca.sh
	 bash protein_dry.sh
	 Rscript rmsd.R
	 Rscript rmsf.R
	 Rscript dccm_md.R
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
    1）
     cd $dir
	 chmod +x combine1.sh
	 chmod +x combine2.sh
	 chmod +x combine3.sh
	 bash combine1.sh
	 bash combine2.sh
	 bash combine3.sh
	 return
	 ;;
	2）
	 cd $dir
	 chmod +x combine1.sh
	 bash combine1.sh
	 return
	 ;;
	3)
	 cd $dir
	 chmod +x combine2.sh
	 bash combine2.sh
	 return
	 ;;
	4)
	 cd $dir
	 chmod +x combine3.sh
	 bash combine3.sh
	 return
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
	 bash protein_ca.sh
	 bash protein_dry.sh
	 return
	 ;;
	2)
	  cd $dir
	 chmod +x protein_ca.sh
	 bash protein_ca.sh
	 return
	 ;;
	3)
	 cd $dir
	 chmod +x protein_dry.sh
	 bash protein_dry.sh
	 return
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
	 Rscript rmsd.R
	 Rscript rmsf.R
	 Rscript dccm_md.R
	 return
	 ;;
	2)
	 cd $dir
	 Rscript rmsd.R
	 return
	 ;;
	3)
	 cd $dir
	 Rscript rmsf.R
	 return
	 ;;
	4)
	 cd $dir
	 Rscript dccm_md.R
	 return
	 ;;
	5)
     return 
     ;;
    *)
     echo "无效选项，请重新输入！"
	 ;;
done


