PREFIX := make>

CXX := g++
CXXFLAGS := -Wall -Wextra -Wshadow
OPTFLAGS := -O3

SRCEXT := cpp
SRCDIR := src
BUILDDIR := build
BINDIR := bin

TARGET := bin/main
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

.PHONY: all print clean distclean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	@echo "$(PREFIX) $(CXX) $^ -o $(TARGET)"
	@$(CXX) $^ -o $(TARGET)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	@echo "$(PREFIX) $(CXX) $(CXXFLAGS) $(OPTFLAGS) -c -o $@ $<"
	@$(CXX) $(CXXFLAGS) $(OPTFLAGS) -c -o $@ $<

print: $(SOURCES)
	@echo "$(PREFIX) Source files: $^"

fmt: $(SOURCES)
	@echo "$(PREFIX) Formatting sources: $^"
	@clang-format -i $^

clean:
	@echo "$(PREFIX) Cleaning..."; 
	@echo "$(PREFIX) $(RM) -r $(BUILDDIR)"
	@$(RM) -r $(BUILDDIR)

distclean: clean
	@echo "$(PREFIX) $(RM) -r $(BINDIR)"
	@$(RM) -r $(BINDIR)
