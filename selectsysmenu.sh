#!/bin/bash
# The Shell was used for system administator.
# Create function for system administrator.


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
# Linux 四个界定：
# PS1: Shell默认界定符
# PS2: 命令提示符界定符
# PS3: select语句界定符
# PS4: set-x语句界定符


PS3="请输入选择项: "
select option in "添加新用户" "添加私匙" "重置密码" "删除用户" "退出程序"
do
    case $option in
    "添加新用户")
        AddUser;;
    "添加私匙")
        Addprivate;;
    "重置密码")
        setpass;;
    "删除用户")
        delusr;;
    "退出程序")
        break;;
    *)
        clear
        echo -e "\033[31m请输入正确的选择项！！！\033[0m";;
    esac
done
clear
