# 设置使用xelatex编译
$pdflatex = 'xelatex -file-line-error --shell-escape -src-specials -synctex=1 -interaction=nonstopmode %O %S';

# 设置文件类型和编译选项
@default_files = ('*.tex');
$preview_continuous_mode = 1;

# 启用文件更改时自动编译
$latex = 'xelatex %O %S';
$recorder = 1;
$preview_continuous_mode = 1;
$pdf_previewer = 'zathura %O %S';

# 清理生成的文件
$clean_ext = 'bbl lox pdfsync out run.xml synctex.gz';

# 设置PDF输出文件名
$pdf_mode = 1;
$pdf_filename = '%D.pdf';
