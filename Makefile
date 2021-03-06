TARGET ?= siciliano
keep-intermediates ?= no

.PHONY : clean check

# auto-detect AnIta files when in any subdir
# ANITA = $(shell find . -type f -name 'italiano.*' -printf "%P\n" -quit | sed -e "s/\w\+\.\w\+\$//g")
VPATH = ./AnIta-v1.2core:./v1.2core:./*:$(ANITA)

# empties .SECONDARY if set to yes via command line,
# thus rendering intermediates 'important' to keep
ifeq ($(KEEP-INTERMEDIATES),yes)
  .SECONDARY:
endif

default: SiMoN

# construct morpholocical analyzer/generator pair
SiMoN: $(TARGET).generator.hfst $(TARGET).analyzer.hfst

# remove HFST binaries and documentation file
clean: $(shell find . -iname '*.hfst') $(shell find . -iname '*.lexc.hfst')
	@rm -f $^

include *.mk
