#!/bin/bash

# 1. Prompt for User Input
read -r -p "Please input file name(s) to add to git: " fname
if [ -e $fname ]; then
    # 2. stage file for commit
    git add $fname
    # 3. Echo status
    echo $(git status)
else
    echo "$fname does not exist"
    exit 1
fi
# 4. Ask to continue
read -r -p "Ready to continue? (y/n) " resp
if [ "$resp" = "n" ]; then
    exit 1
else
    # 5. Ask for commit message 
    read -r -p "Commit message: "
    # 6. Commit with message
    git commit -m $REPLY
    # 7. Echo status
    echo $(git status)
fi
# 8. Ask if ready to push
read -r -p "Ready to push? (y/n) " push
if [ "$push" = "n" ]; then
    exit 1
else
    # 9. git push
    git push
fi