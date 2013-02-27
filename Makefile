##
## Makefile for resume
## by lenormf
##

NAME = resume
EXT_OUT = pdf
EXT_IN = tex

$(NAME).$(EXT_OUT):
	@which rubber &>/dev/null && rubber -d $(NAME).$(EXT_IN) \
		|| { which pdflatex &>/dev/null && pdflatex $(NAME).$(EXT_IN); }

all: $(NAME).$(EXT_OUT)

view: $(NAME).$(EXT_OUT)
	@which xpdf &>/dev/null && xpdf $(NAME).$(EXT_OUT) \
		|| { which evince &>/dev/null && evince $(NAME).$(EXT_OUT); }

clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).lot $(NAME).lof $(NAME).toc $(NAME).out

distclean: clean
	rm -f $(NAME).$(EXT_OUT)

re: distclean all
