#!/bin/bash
# check the System OS version.
# Authorized by eason
os_no=`cat /etc/redhat-release|awk '{printf("%d\n", $4)}'`
for i in cups pcscd alsasound iscsitarget smb acpid iptables ip6tables
do
	for k in b64 b32 crontab hosts hosts-allow hosts-deny fstab passwd shadow group gshadow ntp sysctl limits grub ssh udev profile kdump lvm login-defs i18n network
	  do
       if [ $os_no -lt 7 ]&&[ $os_no -ge 6 ];then
         # running service command as purpose
         #check whether the service is in running status.
           service $i status 2>/dev/null|grep "running"
           if [ $? -eq 0 ];
           then
               service $i stop 2>/dev/null
               chkconfig $i off 2>/dev/null
           else
              echo
           fi
           chmod 600 /boot/grub/grub.conf
           		grep $k /etc/audit/audit.rules
           		if [ $? -eq 0 ];then
           			echo "All parameters were configured by Administrator."
           		else
                # get user all actions in system in below 6
                echo "-a exit,always -F arch=b64 -S execve -k exec" >> /etc/audit/audit.rules
                echo "-a exit,always -F arch=b32 -S execve -k exec" >> /etc/audit/audit.rules
                echo "-w /etc/crontab -p wa -k crontab" >> /etc/audit/audit.rules
                echo "-w /etc/hosts -p wa -k hosts" >> /etc/audit/audit.rules
                echo "-w /etc/hosts.allow -p wa -k hosts-allow" >> /etc/audit/audit.rules
                echo "-w /etc/hosts.deny -p wa -k hosts-deny" >> /etc/audit/audit.rules
                echo "-w /etc/fstab -p wa -k fstab" >> /etc/audit/audit.rules
                echo "-w /etc/passwd -p wa -k passwd" >> /etc/audit/audit.rules
                echo "-w /etc/shadow -p wa -k shadow" >> /etc/audit/audit.rules
                echo "-w /etc/group -p wa -k group" >> /etc/audit/audit.rules
                echo "-w /etc/gshadow -p wa -k gshadow" >> /etc/audit/audit.rules
                echo "-w /etc/ntp.conf -p wa -k ntp"  >> /etc/audit/audit.rules
                echo "-w /etc/sysctl.conf -p wa -k sysctl" >> /etc/audit/audit.rules
                echo "-w /etc/security/limits.conf -p wa -k limits" >> /etc/audit/audit.rules
                echo "-w /boot/grub/grub.conf -p wa -k grub" >> /etc/audit/audit.rules
                echo "-w /etc/ssh/sshd_config -p wa -k ssh"  >> /etc/audit/audit.rules 
                echo "-w /etc/udev/rules.d/ -p wa -k udev" >> /etc/audit/audit.rules
                echo "-w /etc/profile -p wa -k profile" >> /etc/audit/audit.rules
                echo "-w /etc/kdump.conf -p wa -k kdump" >> /etc/audit/audit.rules
                echo "-w /etc/lvm/lvm.conf -p wa -k lvm" >> /etc/audit/audit.rules
                echo "-w /etc/login.defs -p wa -k login-defs" >> /etc/audit/audit.rules
                echo "-w /etc/sysconfig/i18n -p wa -k i18n" >> /etc/audit/audit.rules
                echo "-w /etc/sysconfig/network -p wa -k network"  >> /etc/audit/audit.rules
                echo "-w /etc/rsyslog.conf -p wa -k rsyslog" >> /etc/audit/audit.rules
                  # echo "-w /etc/multipath.conf -p wa -k multipath" >> /etc/audit/rules.d/audit.rules
              fi
       elif [ $os_no -le 5 ];then
              service sendmail stop
              chkconfig sendmail off
              chmod 600 /boot/grub/grub.conf
              # get user all actions in system in below 6
              grep $k /etc/audit/audit.rules
              echo "-a exit,always -F arch=b64 -S execve -k exec" >> /etc/audit/audit.rules
              echo "-a exit,always -F arch=b32 -S execve -k exec" >> /etc/audit/audit.rules
              echo "-w /etc/crontab -p wa -k crontab" >> /etc/audit/audit.rules
              echo "-w /etc/hosts -p wa -k hosts" >> /etc/audit/audit.rules
              echo "-w /etc/hosts.allow -p wa -k hosts-allow" >> /etc/audit/audit.rules
              echo "-w /etc/hosts.deny -p wa -k hosts-deny" >> /etc/audit/audit.rules
              echo "-w /etc/fstab -p wa -k fstab" >> /etc/audit/audit.rules
              echo "-w /etc/passwd -p wa -k passwd" >> /etc/audit/audit.rules
              echo "-w /etc/shadow -p wa -k shadow" >> /etc/audit/audit.rules
              echo "-w /etc/group -p wa -k group" >> /etc/audit/audit.rules
              echo "-w /etc/gshadow -p wa -k gshadow" >> /etc/audit/audit.rules
             echo "-w /etc/ntp.conf -p wa -k ntp"  >> /etc/audit/audit.rules
              echo "-w /etc/sysctl.conf -p wa -k sysctl" >> /etc/audit/audit.rules
              echo "-w /etc/security/limits.conf -p wa -k limits" >> /etc/audit/audit.rules
              echo "-w /boot/grub/grub.conf -p wa -k grub" >> /etc/audit/audit.rules
              echo "-w /etc/ssh/sshd_config -p wa -k ssh"  >> /etc/audit/audit.rules 
              echo "-w /etc/udev/rules.d/ -p wa -k udev" >> /etc/audit/audit.rules
              echo "-w /etc/profile -p wa -k profile" >> /etc/audit/audit.rules
              echo "-w /etc/kdump.conf -p wa -k kdump" >> /etc/audit/audit.rules
              echo "-w /etc/lvm/lvm.conf -p wa -k lvm" >> /etc/audit/audit.rules
              echo "-w /etc/login.defs -p wa -k login-defs" >> /etc/audit/audit.rules
              echo "-w /etc/sysconfig/i18n -p wa -k i18n" >> /etc/audit/audit.rules
              echo "-w /etc/sysconfig/network -p wa -k network"  >> /etc/audit/audit.rules
                # echo "-w /etc/multipath.conf -p wa -k multipath" >> /etc/audit/audit.rules
              grep "syslog" /etc/audit/audit.rules
                if [ $? -eq 0 ];then
                	echo "Configured by admin."
                else
                  echo "-w  /etc/syslog.conf -p wa -k syslog" >>/etc/audit/audit.rules
                fi
       else
           # running systemctl as service command
           systemctl status $i 2>/dev/null|grep "running"
             if [ $? -eq 0 ];
               then
               systemctl stop $i 2>/dev/null
               systemctl disable $i 2>/dev/null
             else
               echo
             fi
           systemctl stop firewalld
           systemctl disable firewalld
           chmod 600 /boot/grub2/grub.cfg
           grep $k /etc/audit/rules.d/audit.rules
           if [ $? -eq 0 ];then
           	  echo "All parameters were configured by Administrator."
           else
             # get user all actions in system in 7
             echo "-a exit,always -F arch=b64 -S execve -k exec" >> /etc/audit/rules.d/audit.rules
             echo "-a exit,always -F arch=b32 -S execve -k exec" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/crontab -p wa -k crontab" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/hosts -p wa -k hosts" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/hosts.allow -p wa -k hosts-allow" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/hosts.deny -p wa -k hosts-deny" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/fstab -p wa -k fstab" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/passwd -p wa -k passwd" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/shadow -p wa -k shadow" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/group -p wa -k group" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/gshadow -p wa -k gshadow" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/chrony.conf -p wa -k ntp" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/sysctl.conf -p wa -k sysctl" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/security/limits.conf -p wa -k limits" >> /etc/audit/rules.d/audit.rules
             echo "-w /boot/grub2/grub.conf -p wa -k grub" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/ssh/sshd_config -p wa -k ssh" >> /etc/audit/rules.d/audit.rules 
             echo "-w /etc/udev/rules.d/ -p wa -k udev" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/profile -p wa -k profile" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/kdump.conf -p wa -k kdump" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/lvm/lvm.conf -p wa -k lvm" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/login.defs -p wa -k login-defs" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/rsyslog.conf -p wa -k rsyslog" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/locale.conf -p wa -k i18n" >> /etc/audit/rules.d/audit.rules
             echo "-w /etc/sysconfig/network -p wa -k network" >> /etc/audit/rules.d/audit.rules
             # echo "-w /etc/multipath.conf -p wa -k multipath" >> /etc/audit/rules.d/audit.rules
           fi
       fi
     done  
done
# disable selinux for users
grep "SELINUX=enforcing" /etc/selinux/config 2>/dev/null
if [ $? -eq 0 ];
	then
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
    setenforce 0
else
    echo "SELinux is already be configurated by Administrator."
fi
# check History record method profile
grep "HISTTIMEFORMAT" /etc/bashrc
if [ $? -eq 0 ];
	then
		echo "History Record profile was configured by Administrator."
else		
    sed '/sw=4/aHISTTIMEFORMAT=\"\%F\ \%T\ \"/' /etc/bashrc
    sed -i 's/\(HISTSIZE=\)1000/\15000/' /etc/bashrc
fi
# Modify mount file for purpose usage.
# For /tmp /var add nodev nosuid parameters
# For /home add nosuid parameters,also add errors=panic for all ext3 and ext4 fs mount type use errors=panic
# protect the security file of the system
    sed -i 's/\(MAILTO=\).*/\1\"\"/' /etc/crontab
		chmod 400 /etc/crontab
		chmod 400 /etc/securetty
# Modify syslog lograte size
sed -i 's/\(num_logs=\).*/\14/' /etc/audit/auditd.conf
sed -i 's/\(max_logs_file=\).*/\150/' /etc/audit/auditd.conf
sed -i 's/\(flush=\).*/\1NONE/' /etc/audit/auditd.conf
# if use SOC control the syslog please use below parameters
# sed -i 's/\(active=\).*/\1yes/' >> /etc/audisp/plugins.d/syslog.conf
# sed -i 's/\(args=\).*/\1LOG_LOCAL2/' >> /etc/audisp/plugins.d/syslog.conf
# Disable USB devices in Server
echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb-storage.conf
# Disable Server Ctrl+ALT+DEL hotkeys
if [ $os_no -lt 6 ];then
		sed -i 's/^\(ca::ctrlaltdel.*\)/#\1/g' /etc/inittab
elif [ $os_no -lt 7 ]&&[ $os_no -ge 6 ];then
    sed -i 's/^start on control-alt-delete/#start on control-alt-delete/g' /etc/init/control-alt-delete.conf
else
    systemctl mask ctrl-alt-del.target
fi
chmod 600 /etc/inittab
# Password complex usage with complicate characters in it,and the recently 3 times password will be not allow to use except the password was loop as the four
if [ $os_no -le 6 ];
	then
		sed -i '/^password[[:space:]]\{1,\}requisite[[:space:]]\{1,\}pam_cracklib.so/a\password    required      pam_pwhistory.so use_authtok remember=3 enforce_for_root' /etc/pam.d/system-auth-ac
		sed -i "s/^\(password[[:space:]]*requisite[[:space:]]*pam_cracklib.so\).*/\1 try_first_pass retry=6 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 enforce_for_root/g" /etc/pam.d/system-auth-ac
else
    sed -i  '/^password[[:space:]]\{1,\}requisite[[:space:]]\{1,\}pam_pwquality.so/a\password    required      pam_pwhistory.so use_authtok remember=3 enforce_for_root' /etc/pam.d/system-auth-ac
    sed -i "s/^\(password[[:space:]]*requisite[[:space:]]*pam_pwquality.so\).*/\1 try_first_pass local_users_only retry=6 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 enforce_for_root authtok_type=/g" /etc/pam.d/system-auth-ac
fi
# Change the password expire date and warnning day
sed -i 's/^\(PASS_MAX_DAYS[[:space:]]*\).*/\190/' /etc/login.defs
sed -i 's/^\(PASS_MIN_DAYS[[:space:]]*\).*/\11/' /etc/login.defs
sed -i 's/^\(PASS_MIN_LEN[[:space:]]*\).*/\18/' /etc/login.defs
sed -i 's/^\(PASS_WARN_AGE[[:space:]]*\).*/\17/' /etc/login.defs
for j in UNKFAIL RETRIES LASTLOG
	do
		grep $j /etc/login.defs
		if [ $? -eq 0 ];then
			echo "The Paramenters were set by Administrator."
		else
      echo "LOG_UNKFAIL_ENAB        yes" >> /etc/login.defs
      echo "LOGIN_RETRIES           6"  >> /etc/login.defs
      echo "LASTLOG_ENAB           yes" >> /etc/login.defs
    fi
  done
chmod 600 /etc/login.defs
# Set timeout session for ssh or tty login
grep "TMOUT" /etc/profile
if [ $? -eq 0 ];then
	echo "Timeout is set."
else
  echo "TMOUT=300" >> /etc/profile
fi
# set retry login for user and lock for 5 minutes if user retry for 3 times
if [ $os_no -le 5 ];
	then
		sed -i '/auth[[:space:]]*required[[:space:]]*pam_env.so/a\auth        required      pam_tally2.so onerr=fail deny=3 unlock_time=300 even_deny_root root_unlock_time=300' /etc/pam.d/system-auth-ac
		sed -i '/account[[:space:]]*required[[:space:]]*pam_unix.so/i\account     required      pam_tally2.so' /etc/pam.d/system-auth-ac
else
    sed -i '/auth[[:space:]]*required[[:space:]]*pam_env.so/a\auth        required      pam_tally2.so onerr=fail deny=3 unlock_time=300 even_deny_root root_unlock_time=300' /etc/pam.d/system-auth-ac
    sed -i '/account[[:space:]]*required[[:space:]]*pam_unix.so/i\account     required      pam_tally2.so' /etc/pam.d/system-auth-ac
    sed -i '/auth[[:space:]]*required[[:space:]]*pam_env.so/a\auth        required      pam_tally2.so onerr=fail deny=6 unlock_time=300 even_deny_root root_unlock_time=300' /etc/pam.d/password-auth-ac
    sed -i '/account[[:space:]]*required[[:space:]]*pam_unix.so/i\account     required      pam_tally2.so' /etc/pam.d/password-auth-ac
fi
# remove the remote know hosts for connection
rm -f /root/.rhosts  /root/.shosts  /etc/hosts.equiv  /etc/shosts.equiv 2>/dev/null
# configure ssh configure file
sed -i 's/^#Port/Port/' /etc/ssh/sshd_config
sed -i 's/^#LogLevel/LogLevel/' /etc/ssh/sshd_config
sed -i 's/^#MaxAuthTries[[:space:]]*6/MaxAuthTries 3/' /etc/ssh/sshd_config
sed -i 's/^#StrictModes/StrictModes/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin[[:space:]]*yes/PermitRootLogin\ no/' /etc/ssh/sshd_config
sed -i 's/^#RhostsRSAAuthentication/RhostsRSAAuthentication/' /etc/ssh/sshd_config
sed -i 's/^#IgnoreUserKnownHosts[[:space:]]*yes/IgnoreUserKnownHosts no/' /etc/ssh/sshd_config
sed -i 's/^#PermitEmptyPasswords/PermitEmptyPasswords/' /etc/ssh/sshd_config
grep "Ciphers" /etc/ssh/sshd_config
if [ $? -eq 0 ];then
	 echo "Encrypt method is set."
else
   echo "Ciphers 3des-cbc" >>/etc/ssh/sshd_config
   echo "MACs hmac-sha1,hmac-md5" >> /etc/ssh/sshd_config
fi
# The End #
