# shellcheck source=lib/shell/config/.bash_aliases
# shellcheck source=lib/shell/config/.bash_exports
# shellcheck source=lib/shell/config/.bash_functions
# shellcheck source=lib/shell/config/.bash_prompt

for FILE in ~/.bash_{aliases,exports,functions,prompt}; do
  [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE
