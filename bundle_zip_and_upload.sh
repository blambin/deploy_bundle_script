#!/bin/sh
#
#
#


config_file=./bundle_upload.conf

. ${config_file}

echo '进入 tomcat 目录:'${deploy_dir} &&
cd ${deploy_dir} &&

echo '正在删除旧的网站文件..' &&
rm -rf ../${project_dir} &&
rm -rf ../${project_dir}.zip &&

echo '正在拷贝网站文件..' &&
cp -rf ${local_project_dir}/ ../${project_dir} &&

echo '清除开发配置文件..' &&


for (( i = 0; i < ${#config_file_list[@]}; i++ )) do
  rm -rf ../${project_dir}/WEB-INF/classes/${config_file_list[$i]}
done

cd ../ &&
zip -r ./${project_dir}.zip ./${project_dir}/ > /dev/null &&
echo '打包完毕..' &&

echo '开始拷贝文件 到服务器 '${ip}' 上' &&
scp -P ${port} ./${project_dir}.zip root@${ip}:${remote_deploy_dir} &&
echo '文件已经成功拷贝到服务器上了'
