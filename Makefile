all: qrcode pdf clean

pdf:
	latexmk -pdf cv.tex

clean:
	@rm -f cv.aux cv.fdb_latexmk cv.fls cv.log cv.out qrcode.png

qrcode:
	grep 'iconemail{' cv.tex  | cut -d'{' -f4 | cut -d'}' -f1 | qr > qrcode.png