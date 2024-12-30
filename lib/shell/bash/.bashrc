for FILE in ~/.bash_{env,aliases,functions,extra}; do
  [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE
