#!/bin/bash
# The Shell was used for system administator.
# Create function for system administrator.

# Create system admin menu.

function menu {
    clear
echo
echo -e "\033[35m\t\t\t系统管理菜单:\n\033[0m"
echo -e "\t---------------"
echo -e "\033[32m\t1. 添加系统新用户.\033[0m"
echo -e "\033[32m\t2. 系统新用户添加私匙.\033[0m"
echo -e "\033[32m\t3. 系统新用户初始密码设置.\033[0m"
echo -e "\033[32m\t4. 删除系统用户(root除外).\033[0m"
echo -e "\033[32m\t0. 退出小程序...\033[0m"
echo -e "\t---------------"
echo -e "\033[32m\t\t请选择: \n\033[0m"
read -n 1 option
}

# Create username in system.

function AddUser {
echo -e "\033[32m请用英文输入新用户名: \n\033[0m"
read name
ln1=`cat /etc/passwd|grep $name|wc -l`
if [[ $ln1 -ne 0 ]]
    then
        echo -e "\033[31m用户名已经存在!!!\n\033[0m"
else
    useradd -c $name -md /home/$name -s /bin/bash $name
    echo -e "\033[32m新用户名$name已创建成功！！！\n\033[0m"
fi
}


# Add Private Key in user home folder for bastion host.

function Addprivate {
echo -e "\033[31m请确保该用户是系统新用户，若不是请退出。\n\033[0m"
cp -ar /home/yshan/new.yaoshan.pem ~
}

# Set password for new username in system.

function setpass {
echo -e "\033[32m请输入要更新密码的用户名: \n\033[0m"
read uname
lns=`cat /etc/passwd|grep $uname|wc -l`
if [[ lns -eq 0 ]]
    then
        echo -ne "\033[31m用户名不存在，请先创建用户！！！\033[0m"
else
    echo "Redhat123!@#"|passwd --stdin $uname
fi
}

# Remove unused username in system.

function delusr {
echo -e "\033[32m请输入需要删除的用户名: \n\033[0m"
read duname
Rval=`cat /etc/passwd|grep  $duname|wc -l`
if [ $Rval -eq 0 ]
    then
        echo -e "\033[31m用户名不存在，请确认是否输入正确.\n\033[0m"
else
    userdel $duname
    rm -f /var/mail/$duname
    rm -rf /home/$duname
    echo -e "\033[32m用户已删除成功！！！\n\033[0m"
fi
}
while [ 1 ]
do
    menu
    case $option in 
    0)
        break;;
    1)
        AddUser;;
    2)
        Addprivate;;
    3)
        setpass;;
    4)
        delusr;;
    *)
        echo -e "\033[31m请输入正确的选项！！！\n\033[0m"
    esac
    echo -ne "\033[32m\n\n\t\t\t请按任意键继续...\n\033[0m"
    read -n 1 line
done
clear
