
#!/bin/sh

if ! orphans=$(paru -Qtdq 2> /dev/null | wc -l ); then
    orphans=0
fi

if [ $orphans -gt 0 ]; then
    echo $orphans
else
    echo "0"
fi
