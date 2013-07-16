Title: Rip data cd to iso
Category: osx
Tags: osx, iso
Date: 2013-07-14


用`Disk Util`, 在左边栏选择cd，然后选择创建image，类型要选DVD/CD Master，然后就会生成一个`.cdr`文件，再执行下列命令：

	cd ~/Desktop
	hdiutil makehybrid -iso -joliet -o Master.iso Master.cdr
	
就能做成windows能用的iso了