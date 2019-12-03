# Generate STL output files from OpenSCAD source
# Brian K. White - b.kenyon.w@gmail.com

model = adafruit_hdmi_backpack
variants = 5inch_vesa75_pi34 5inch_vesa100_pi34 7inch_vesa75_pi34 7inch_vesa100_pi34

openscad = openscad-nightly

.PHONY: all
all: $(variants)

.PHONY: $(variants)
$(variants): %: $(model)_%.stl $(model)_%.png

# Generate .stl for 3d printing
$(model)_%.stl: $(model).scad
	$(openscad) -D'size="$(word 1,$(subst _, ,$(*)))"' -D'vesa="$(word 2,$(subst _, ,$(*)))"' -o $(@) $(model).scad

# Generate .png for README.md
$(model)_%.png: $(model).scad
	$(openscad) -D'size="$(word 1,$(subst _, ,$(*)))"' -D'vesa="$(word 2,$(subst _, ,$(*)))"' --colorscheme DeepOcean --imgsize 1024,768 --viewall -o $(@) $(model).scad

.PHONY: help list
help list:
	@echo "Targets: all $(variants) help list clean"
	@echo
	@echo "  all = generate .stl and .png for every available variation: ($(variants))"
	@echo "  $(variants) = generate .stl and .png for the specified variation"
	@echo "  help or list: display this text"
	@echo "  clean: delete *.stl *.png"

.PHONY: clean
clean:
	rm -f *.stl *.png
