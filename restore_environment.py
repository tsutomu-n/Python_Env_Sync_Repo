import os


def install_pyenv_version():
    with open("pyenv_versions.txt", "r") as f:
        version = f.read().strip()
    os.system(f"pyenv install {version}")
    os.system(f"pyenv local {version}")


def install_poetry_dependencies():
    os.system("poetry install")


def copy_zsh_files():
    os.system("cp .zshrc ~/.zshrc")
    os.system("cp .zshenv ~/.zshenv")


def source_zsh():
    os.system("source ~/.zshrc")


if __name__ == "__main__":
    install_pyenv_version()
    install_poetry_dependencies()
    copy_zsh_files()
    source_zsh()
