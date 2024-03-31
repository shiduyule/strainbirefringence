fid = fopen(F:\----KDP-Data----\Raman\20230210\1-M.txt); % 读取文本文件
A = []; % 创建一个数组
tline = fgetl(fid);
count = 0; % 技数 变量
while ischar(th=line) % ischar 判断输入是否为字符数组
    tline = fgetl(fid);
    count = count + 1;
    if mod(count)
