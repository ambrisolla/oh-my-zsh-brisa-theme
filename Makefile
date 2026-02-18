.PHONY: install uninstall install-ohmyzsh

THEME_NAME = brisa
ZSH_THEMES_DIR = $(or $(ZSH),$(HOME)/.oh-my-zsh)/themes

install-ohmyzsh:
	@if [ -d "$(HOME)/.oh-my-zsh" ]; then \
		echo "Oh My Zsh is already installed!"; \
	else \
		echo "Installing Oh My Zsh..."; \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
		echo "✔ Oh My Zsh installed successfully!"; \
	fi

install:
	@if [ ! -d "$(ZSH_THEMES_DIR)" ]; then \
		echo "Error: Oh My Zsh themes directory not found."; \
		echo ""; \
		echo "Run 'make install-ohmyzsh' first to install Oh My Zsh, or install manually:"; \
		echo "  sh -c \"\$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""; \
		echo ""; \
		echo "More info: https://ohmyz.sh/"; \
		exit 1; \
	fi
	@cp $(THEME_NAME).zsh-theme $(ZSH_THEMES_DIR)/
	@echo "✔ Theme '$(THEME_NAME)' installed successfully!"
	@echo ""
	@echo "To activate the theme, add this to your ~/.zshrc:"
	@echo "  ZSH_THEME=\"$(THEME_NAME)\""
	@echo ""
	@echo "Then reload your shell:"
	@echo "  source ~/.zshrc"

uninstall:
	@rm -f $(ZSH_THEMES_DIR)/$(THEME_NAME).zsh-theme
	@echo "✔ Theme '$(THEME_NAME)' uninstalled successfully!"
