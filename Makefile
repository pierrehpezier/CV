all: qrcode pdf clean

pdf:
	convert photo.jpg -define jpeg:extent=256kb /dev/shm/photo_compressed.jpg
	latexmk -pdf cv.tex

clean:
	@rm -f cv.aux cv.fdb_latexmk cv.fls cv.log cv.out qrcode.png /dev/shm/photo_compressed.jpg

qrcode:
	grep 'iconemail{' cv.tex  | cut -d'{' -f4 | cut -d'}' -f1 | qr > qrcode.png