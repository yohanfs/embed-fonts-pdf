input      := main.pdf
output     := main_embed.pdf

menu:
	more Makefile

pdf-to-ps:
	pdf2ps $(input)

ps-to-pdf:
	ps2pdf \
        -dPDFSETTINGS=/prepress \
        -dSubsetFonts=true \
        -dEmbedAllFonts=true \
        -dMaxSubsetPct=100 \
        -dCompatibilityLevel=1.4 $(input)

extract-bookmark:
	pdftk $(input) dump_data output bookmarkdata.txt

insert-bookmark:
	pdftk $(input) update_info bookmarksdata.txt output $(output) 

deletetype3:
	gs -o $(output) -dNoOutputFonts -sDevice=pdfwrite $(input)

pdffont-check:
	pdffonts $(input)

 

    
