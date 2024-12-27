for FILE in ~/.bash_{aliases,exports,functions,prompt}; do
  [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE
