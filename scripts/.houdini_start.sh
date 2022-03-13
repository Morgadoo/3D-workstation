echo "Start Houdini"
# sudo /etc/init.d/sesinetd start
export LD_PRELOAD="/usr/lib64/libc_malloc_debug.so.0"
/opt/hfs19.0/bin/houdinifx $1
